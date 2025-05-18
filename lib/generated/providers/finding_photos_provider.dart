import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/finding_photos_model.dart';
import '../repositories/finding_photos_repository.dart';
import '../shared/errors/app_exception.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

/// Database triggers associated with this table that may affect operations:
/// - update_finding_photo_count: INSERT AFTER - EXECUTE FUNCTION update_finding_photo_count()
///   Signature: update_finding_photo_count() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_finding_photo_count>
/// - update_finding_photo_count: DELETE AFTER - EXECUTE FUNCTION update_finding_photo_count()
///   Signature: update_finding_photo_count() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_finding_photo_count>

// Repository provider
final findingPhotosRepositoryProvider = Provider<FindingPhotosRepository>((ref) {
  AppLogger.debug('Creating FindingPhotosRepository instance', loggerName: 'Provider');
  return FindingPhotosRepository(Supabase.instance.client);
});

// Main provider for managing finding_photos data
final findingPhotosProvider = StateNotifierProvider<FindingPhotosNotifier, AsyncValue<List<FindingPhotosModel>>>((ref) {
  final repository = ref.watch(findingPhotosRepositoryProvider);
  AppLogger.debug('Creating FindingPhotosNotifier', loggerName: 'Provider');
  return FindingPhotosNotifier(repository);
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
  
  return 'finding_photos:${parts.join(',')}';
}

// Provider to get a single finding_photos by ID with caching
final findingPhotosByIdProvider = FutureProvider.family<FindingPhotosModel?, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = 'finding_photos:id:$id';
  
  AppLogger.debug('findingPhotosByIdProvider called with id: $id', loggerName: 'Provider');
  final repository = ref.watch(findingPhotosRepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<FindingPhotosModel?>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No finding_photo found with ID: $id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found finding_photo with ID: $id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotosById');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Provider to get filtered finding_photos with proper caching
final filteredFindingPhotosProvider = FutureProvider.family<List<FindingPhotosModel>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filteredFindingPhotosProvider called with key: $cacheKey', loggerName: 'Provider');
  final repository = ref.watch(findingPhotosRepositoryProvider);
  
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
    
    final results = await AppCache().getOrFetch<List<FindingPhotosModel>>(
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
    
    AppLogger.debug('filteredFindingPhotosProvider returned ${results.length} items for key: $cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FilteredFindingPhotos');
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

/// Notifier class that handles finding_photos operations
class FindingPhotosNotifier extends StateNotifier<AsyncValue<List<FindingPhotosModel>>> {
  final FindingPhotosRepository _repository;

  FindingPhotosNotifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      AppLogger.debug('Loading initial finding_photos data', loggerName: 'Provider');
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Loaded initial data', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Failed to load initial data', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Fetch all finding_photos with basic sorting and filtering
  Future<List<FindingPhotosModel>> fetchAll({
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Fetching data', 
        details: 'filters: $filters, orderBy: $orderBy, limit: $limit, offset: $offset');
      
      // Create a cache key if filters are provided
      String? cacheKey;
      if (filters != null && filters.isNotEmpty) {
        cacheKey = _createCacheKey(filters);
        AppLogger.debug('Using cache key: $cacheKey for fetchAll', loggerName: 'Provider');
      }
      
      state = const AsyncValue.loading();
      
      // Use cache if filters are provided, otherwise fetch directly
      final List<FindingPhotosModel> results;
      if (cacheKey != null) {
        results = await AppCache().getOrFetch<List<FindingPhotosModel>>(
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
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Data fetched', details: '${results.length} records');
      }
      
      return results;
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotos');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Get a single record by ID with caching
  Future<FindingPhotosModel?> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = 'finding_photos:id:$id';
      
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Getting record by ID', details: 'id: $id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<FindingPhotosModel?>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No finding_photo found with ID: $id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotos');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Create a new record
  Future<FindingPhotosModel> create(FindingPhotosModel model) async {
    try {
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Creating record');
      final result = await _repository.insert(model);
      
      // Clear any cached list results that might contain this entity
      AppLogger.debug('Clearing finding_photos list caches after create', loggerName: 'Provider');
      _clearRelatedCaches(result);
      
      // Update state with new data
      if (mounted) {
        final currentData = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentData, result]);
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Record created', details: 'id: ${result.id}');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotos');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Update an existing record
  Future<FindingPhotosModel?> update(FindingPhotosModel model) async {
    try {
      final modelId = model.id;
      if (modelId.isEmpty) {
        const message = 'Cannot update finding_photo without ID';
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Update failed', details: message);
        throw AppException(message: message);
      }
      
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Updating record', details: 'id: $modelId');
      final result = await _repository.update(model);
      
      // Clear related caches
      if (result != null) {
        // Clear both the specific ID cache and list caches
        final idCacheKey = 'finding_photos:id:$modelId';
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
          ProviderLogging.logStateChange('FindingPhotosNotifier', 'Record updated', details: 'id: $modelId');
        }
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotos');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Deleting record', details: 'id: $id');
      await _repository.delete(id);
      
      // Clear cache entries for this ID
      final idCacheKey = 'finding_photos:id:$id';
      AppLogger.debug('Clearing cache for key: $idCacheKey', loggerName: 'Provider');
      AppCache().remove(idCacheKey);
      
      // Clear list caches that might contain this entity (using a prefix)
      final prefix = 'finding_photos:';
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
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Record deleted', details: 'id: $id');
      }
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FindingPhotos');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Clear caches related to this entity
  void _clearRelatedCaches(FindingPhotosModel entity) {
    final prefix = 'finding_photos:';
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
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Refreshing data');
      if (mounted) {
        state = const AsyncValue.loading();
      }
      
      // Clear all caches related to this entity type
      final prefix = 'finding_photos:';
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
        ProviderLogging.logStateChange('FindingPhotosNotifier', 'Data refreshed', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      ProviderLogging.logStateChange('FindingPhotosNotifier', 'Refresh failed', error: e, stackTrace: stackTrace);
    }
  }
}
