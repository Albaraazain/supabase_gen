import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/active_jobs_old_model.dart';
import '../repositories/active_jobs_old_repository.dart';
import '../shared/errors/app_exception.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

/// Database triggers associated with this table that may affect operations:
/// - active_job_stage_change: UPDATE BEFORE - EXECUTE FUNCTION handle_stage_transition()
///   Signature: handle_stage_transition() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for handle_stage_transition>
/// - set_stage_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_stage_updated_at()
///   Signature: update_stage_updated_at() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_stage_updated_at>

// Repository provider
final activeJobsOldRepositoryProvider = Provider<ActiveJobsOldRepository>((ref) {
  AppLogger.debug('Creating ActiveJobsOldRepository instance', loggerName: 'Provider');
  return ActiveJobsOldRepository(Supabase.instance.client);
});

// Main provider for managing active_jobs_old data
final activeJobsOldProvider = StateNotifierProvider<ActiveJobsOldNotifier, AsyncValue<List<ActiveJobsOldModel>>>((ref) {
  final repository = ref.watch(activeJobsOldRepositoryProvider);
  AppLogger.debug('Creating ActiveJobsOldNotifier', loggerName: 'Provider');
  return ActiveJobsOldNotifier(repository);
});

// Helper to create a stable cache key from filters
String _createCacheKey(Map<String, dynamic> filters) {
  // Sort the keys to ensure consistent ordering
  final sortedKeys = filters.keys.toList()..sort();
  final parts = <String>[];
  
  for (final key in sortedKeys) {
    final value = filters[key];
    parts.add('$key=${value?.toString() ?? 'null'}');
  }
  
  return 'active_jobs_old:${parts.join(',')}';
}

// Provider to get a single active_jobs_old by ID with caching
final activeJobsOldByIdProvider = FutureProvider.family<ActiveJobsOldModel?, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = 'active_jobs_old:id:$id';
  
  AppLogger.debug('activeJobsOldByIdProvider called with id: $id', loggerName: 'Provider');
  final repository = ref.watch(activeJobsOldRepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<ActiveJobsOldModel?>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No active_jobs_old found with ID: $id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found active_jobs_old with ID: $id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOldById');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Provider to get filtered active_jobs_old with proper caching
final filteredActiveJobsOldProvider = FutureProvider.family<List<ActiveJobsOldModel>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filteredActiveJobsOldProvider called with key: $cacheKey', loggerName: 'Provider');
  final repository = ref.watch(activeJobsOldRepositoryProvider);
  
  try {
    // Check if any filter contains a list of values
    bool hasListValues = false;
    String? listField;
    List<dynamic>? listValues;
    
    // Identify if there's a list filter that we should handle with whereIn
    filters.forEach((key, value) {
      if (value is List && value.isNotEmpty) {
        hasListValues = true;
        listField = key;
        listValues = value;
      }
    });
    
    final results = await AppCache().getOrFetch<List<ActiveJobsOldModel>>(
      cacheKey,
      () async {
        // If we have a field with a list of values, use whereIn for better performance
        if (hasListValues && listField != null && listValues != null) {
          // Create a copy of filters without the list field
          final otherFilters = Map<String, dynamic>.from(filters);
          otherFilters.remove(listField);
          
          // First use whereIn for the list values
          final listResults = await repository.whereIn(listField!, listValues!);
          
          // Then filter for any other conditions
          if (otherFilters.isEmpty) {
            return listResults;
          } else {
            // Apply remaining filters manually
            return listResults.where((item) {
              return otherFilters.entries.every((entry) {
                final fieldValue = _getFieldValue(item, entry.key);
                return fieldValue == entry.value;
              });
            }).toList();
          }
        } else {
          // Standard filtering if no lists are present
          return repository.findAll(filters: filters);
        }
      },
      duration: const Duration(seconds: 30), // Short cache time to stay fresh
    );
    
    AppLogger.debug('filteredActiveJobsOldProvider returned ${results.length} items for key: $cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FilteredActiveJobsOld');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Helper to get a field value from a model without using reflection
dynamic _getFieldValue(dynamic model, String fieldName) {
  try {
    // Try to access as a Map or dynamic accessor
    return (model as dynamic)[fieldName];
  } catch (e) {
    // Try to convert the model to a map if it has a toJson method
    try {
      final instance = model as dynamic;
      if (instance != null && instance.toJson != null) {
        final Map<String, dynamic> json = instance.toJson();
        return json[fieldName];
      }
    } catch (_) {
      // Ignore errors from toJson attempt
    }
    
    // If all else fails, try to access via a getter method
    try {
      final instance = model as dynamic;
      switch (fieldName) {
        case 'id': return instance.id;
        case 'created_at': return instance.createdAt;
        case 'updated_at': return instance.updatedAt;
        default: return null;
      }
    } catch (_) {
      return null;
    }
  }
}

/// Notifier class that handles active_jobs_old operations
class ActiveJobsOldNotifier extends StateNotifier<AsyncValue<List<ActiveJobsOldModel>>> {
  final ActiveJobsOldRepository _repository;

  ActiveJobsOldNotifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      AppLogger.debug('Loading initial active_jobs_old data', loggerName: 'Provider');
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Loaded initial data', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Failed to load initial data', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Fetch all active_jobs_old with basic sorting and filtering
  Future<List<ActiveJobsOldModel>> fetchAll({
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Fetching data', 
        details: 'filters: $filters, orderBy: $orderBy, limit: $limit, offset: $offset');
      
      // Create a cache key if filters are provided
      String? cacheKey;
      if (filters != null && filters.isNotEmpty) {
        cacheKey = _createCacheKey(filters);
        AppLogger.debug('Using cache key: $cacheKey for fetchAll', loggerName: 'Provider');
      }
      
      state = const AsyncValue.loading();
      
      // Use cache if filters are provided, otherwise fetch directly
      final List<ActiveJobsOldModel> results;
      if (cacheKey != null) {
        results = await AppCache().getOrFetch<List<ActiveJobsOldModel>>(
          cacheKey,
          () => _repository.findAll(
            orderBy: orderBy,
            ascending: ascending,
            filters: filters,
            limit: limit,
            offset: offset,
          ),
          duration: const Duration(seconds: 30),
        );
      } else {
        results = await _repository.findAll(
          orderBy: orderBy,
          ascending: ascending,
          filters: filters,
          limit: limit,
          offset: offset,
        );
      }
      
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Data fetched', details: '${results.length} records');
      }
      
      return results;
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOld');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Get a single record by ID with caching
  Future<ActiveJobsOldModel?> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = 'active_jobs_old:id:$id';
      
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Getting record by ID', details: 'id: $id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<ActiveJobsOldModel?>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No active_jobs_old found with ID: $id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOld');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Create a new record
  Future<ActiveJobsOldModel> create(ActiveJobsOldModel model) async {
    try {
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Creating record');
      final result = await _repository.insert(model);
      
      // Clear any cached list results that might contain this entity
      AppLogger.debug('Clearing active_jobs_old list caches after create', loggerName: 'Provider');
      _clearRelatedCaches(result);
      
      // Update state with new data
      if (mounted) {
        final currentData = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentData, result]);
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Record created', details: 'id: ${result.id}');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOld');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Update an existing record
  Future<ActiveJobsOldModel?> update(ActiveJobsOldModel model) async {
    try {
      final modelId = model.id;
      if (modelId.isEmpty) {
        const message = 'Cannot update active_jobs_old without ID';
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Update failed', details: message);
        throw AppException(message: message);
      }
      
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Updating record', details: 'id: $modelId');
      final result = await _repository.update(model);
      
      // Clear related caches
      if (result != null) {
        // Clear both the specific ID cache and list caches
        final idCacheKey = 'active_jobs_old:id:$modelId';
        AppLogger.debug('Clearing cache for key: $idCacheKey', loggerName: 'Provider');
        AppCache().remove(idCacheKey);
        
        // Clear list caches that might contain this entity
        _clearRelatedCaches(result);
      }
      
      // Update state if successful
      if (result != null && mounted && state.hasValue) {
        final currentList = state.value!;
        final index = currentList.indexWhere((item) => item.id == modelId);
        
        if (index >= 0) {
          final updated = [...currentList];
          updated[index] = result;
          state = AsyncValue.data(updated);
          ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Record updated', details: 'id: $modelId');
        }
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOld');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Deleting record', details: 'id: $id');
      await _repository.delete(id);
      
      // Clear cache entries for this ID
      final idCacheKey = 'active_jobs_old:id:$id';
      AppLogger.debug('Clearing cache for key: $idCacheKey', loggerName: 'Provider');
      AppCache().remove(idCacheKey);
      
      // Clear list caches that might contain this entity (using a prefix)
      final prefix = 'active_jobs_old:';
      AppLogger.debug('Clearing list caches with prefix: $prefix', loggerName: 'Provider');
      final allExpirations = AppCache().expirations;
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix) && key != idCacheKey) {
          AppCache().remove(key);
        }
      }
      
      // Update state if successful
      if (mounted && state.hasValue) {
        final currentList = state.value!;
        state = AsyncValue.data(
          currentList.where((item) => item.id != id).toList(),
        );
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Record deleted', details: 'id: $id');
      }
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'ActiveJobsOld');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Clear caches related to this entity
  void _clearRelatedCaches(ActiveJobsOldModel entity) {
    final prefix = 'active_jobs_old:';
    AppLogger.debug('Clearing list caches with prefix: $prefix', loggerName: 'Provider');
    
    // Scan all keys in the cache
    final allExpirations = AppCache().expirations;
    int count = 0;
    
    for (final key in allExpirations.keys) {
      // Only clear list caches (not individual ID caches)
      if (key.startsWith(prefix) && !key.startsWith('${prefix}id:')) {
        AppCache().remove(key);
        count++;
      }
    }
    
    if (count > 0) {
      AppLogger.debug('Cleared $count related cache entries', loggerName: 'Provider');
    }
  }
  
  /// Refresh data from the server
  Future<void> refresh() async {
    try {
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Refreshing data');
      if (mounted) {
        state = const AsyncValue.loading();
      }
      
      // Clear all caches related to this entity type
      final prefix = 'active_jobs_old:';
      AppLogger.debug('Clearing all caches with prefix: $prefix', loggerName: 'Provider');
      final allExpirations = AppCache().expirations;
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix)) {
          AppCache().remove(key);
        }
      }
      
      final results = await _repository.findAll();
      
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Data refreshed', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      ProviderLogging.logStateChange('ActiveJobsOldNotifier', 'Refresh failed', error: e, stackTrace: stackTrace);
    }
  }
}
