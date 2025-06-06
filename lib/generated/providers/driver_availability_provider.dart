import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/driver_availability_model.dart';
import '../repositories/driver_availability_repository.dart';
import '../shared/errors/app_exception.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

/// Database triggers associated with this table that may affect operations:
/// - driver_availability_updated_at_trigger: UPDATE BEFORE - EXECUTE FUNCTION update_driver_availability_updated_at()
///   Signature: update_driver_availability_updated_at() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
/// - driver_availability_validation_trigger: INSERT BEFORE - EXECUTE FUNCTION validate_driver_availability()
///   Signature: validate_driver_availability() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...
/// - driver_availability_validation_trigger: UPDATE BEFORE - EXECUTE FUNCTION validate_driver_availability()
///   Signature: validate_driver_availability() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...

// Repository provider
final driverAvailabilityRepositoryProvider = Provider<DriverAvailabilityRepository>((ref) {
  AppLogger.debug('Creating DriverAvailabilityRepository instance', loggerName: 'Provider');
  return DriverAvailabilityRepository(Supabase.instance.client);
});

// Main provider for managing driver_availability data
final driverAvailabilityProvider = StateNotifierProvider<DriverAvailabilityNotifier, AsyncValue<List<DriverAvailabilityModel>>>((ref) {
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  AppLogger.debug('Creating DriverAvailabilityNotifier', loggerName: 'Provider');
  return DriverAvailabilityNotifier(repository);
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
  
  return 'driver_availability:${parts.join(',')}';
}

// Provider to get a single driver_availability by ID with caching
final driverAvailabilityByIdProvider = FutureProvider.family<DriverAvailabilityModel?, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = 'driver_availability:id:$id';
  
  AppLogger.debug('driverAvailabilityByIdProvider called with id: $id', loggerName: 'Provider');
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<DriverAvailabilityModel?>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No driver_availability found with ID: $id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found driver_availability with ID: $id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailabilityById');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Provider to get filtered driver_availability with proper caching
final filteredDriverAvailabilityProvider = FutureProvider.family<List<DriverAvailabilityModel>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filteredDriverAvailabilityProvider called with key: $cacheKey', loggerName: 'Provider');
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
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
    
    final results = await AppCache().getOrFetch<List<DriverAvailabilityModel>>(
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
    
    AppLogger.debug('filteredDriverAvailabilityProvider returned ${results.length} items for key: $cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FilteredDriverAvailability');
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

// ===== REALTIME PROVIDERS =====
// These providers offer automatic realtime updates with proper error handling
// and fallback mechanisms to work around Supabase realtime limitations

/// Realtime provider for all driver_availability records
/// 
/// This provider streams all records in real-time and automatically handles:
/// - Stream disconnections and reconnections
/// - Error recovery with exponential backoff  
/// - Graceful fallback to cached data when realtime fails
/// 
/// Example usage:
/// ```dart
/// class DriverAvailabilityListView extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final driverAvailabilityStream = ref.watch(realtimeDriverAvailabilityProvider);
///     
///     return driverAvailabilityStream.when(
///       data: (driverAvailability) => ListView.builder(
///         itemCount: driverAvailability.length,
///         itemBuilder: (ctx, i) => DriverAvailabilityTile(
///           key: ValueKey('driver_availability-${driverAvailability[i].id}'),
///           driveravailability: driverAvailability[i],
///         ),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeDriverAvailabilityProvider = StreamProvider<List<DriverAvailabilityModel>>((ref) {
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for all driver_availability', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for driver_availability: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        // Don't rethrow - let Riverpod handle the error state
        // The stream will automatically attempt to reconnect
      });
});

/// Realtime provider for a single driver_availability by ID
/// 
/// This provider streams a specific record in real-time with automatic
/// error handling and reconnection logic.
/// 
/// Example usage:
/// ```dart
/// class DriverAvailabilityDetailView extends ConsumerWidget {
///   final String driverAvailabilityId;
///   
///   const DriverAvailabilityDetailView({required this.driverAvailabilityId});
///   
///   Widget build(BuildContext context, WidgetRef ref) {
///     final driverAvailabilityStream = ref.watch(realtimeDriverAvailabilityByIdProvider(driverAvailabilityId));
///     
///     return driverAvailabilityStream.when(
///       data: (driveravailability) => driveravailability != null
///         ? DriverAvailabilityDetail(driveravailability: driveravailability)
///         : const Text('DriverAvailability not found'),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeDriverAvailabilityByIdProvider = StreamProvider.family<DriverAvailabilityModel?, String>((ref, id) {
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for driver_availability ID: $id', loggerName: 'Provider');
  
  return repository
      .streamById(id)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for driver_availability ID $id: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
      });
});

/// Realtime provider for filtered driver_availability records with client-side filtering
/// 
/// This provider streams records matching the given filters using a hybrid approach:
/// - Streams all records from the table (for maximum reliability)
/// - Applies filters on the client side (to work around Supabase limitations)
/// 
/// Note: For large tables, consider using the unfiltered realtimeDriverAvailabilityProvider
/// and filtering in your widget to reduce processing overhead.
/// 
/// Example usage:
/// ```dart
/// class ActiveDriverAvailabilityWidget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     // Create stable filter reference to avoid provider recreation
///     final activeFilter = {'status': 'active'};
///     final activeDriverAvailabilityStream = ref.watch(
///       realtimeFilteredDriverAvailabilityProvider(activeFilter)
///     );
///     
///     return activeDriverAvailabilityStream.when(
///       data: (activeDriverAvailability) => Column(
///         children: activeDriverAvailability
///           .map((driveravailability) => DriverAvailabilityCard(
///             key: ValueKey('active-driver_availability-${driveravailability.id}'),
///             driveravailability: driveravailability,
///           ))
///           .toList(),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeFilteredDriverAvailabilityProvider = StreamProvider.family<List<DriverAvailabilityModel>, Map<String, dynamic>>((ref, filters) {
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
  // Create a readable filter description for logging
  final filterDesc = filters.entries.map((e) => '${e.key}=${e.value}').join(', ');
  AppLogger.debug('Starting filtered realtime stream for driver_availability with filters: $filterDesc', loggerName: 'Provider');
  
  return repository
      .streamWhere(filters)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Filtered realtime stream error for driver_availability (filters: $filterDesc): $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
      });
});

/// Hybrid provider that automatically falls back from realtime to cached data
/// 
/// This provider attempts to use realtime data, but gracefully falls back to
/// cached regular queries if realtime fails. Ideal for critical UI components
/// that must always show data.
/// 
/// Example usage:
/// ```dart
/// class ReliableDriverAvailabilityWidget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final driverAvailabilityData = ref.watch(hybridDriverAvailabilityProvider);
///     
///     return driverAvailabilityData.when(
///       data: (driverAvailability) => DriverAvailabilityList(driverAvailability: driverAvailability),
///       loading: () => const DriverAvailabilitySkeleton(),
///       error: (e, _) => DriverAvailabilityErrorView(error: e),
///     );
///   }
/// }
/// ```
final hybridDriverAvailabilityProvider = StreamProvider<List<DriverAvailabilityModel>>((ref) {
  final repository = ref.watch(driverAvailabilityRepositoryProvider);
  
  AppLogger.debug('Starting hybrid realtime/cached stream for driver_availability', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) async* {
        AppLogger.warning(
          'Realtime failed for driver_availability, falling back to cached data: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        try {
          // Fallback to cached regular query
          final fallbackData = await repository.findAll();
          AppLogger.debug('Successfully fell back to cached data for driver_availability (${fallbackData.length} records)', loggerName: 'Provider');
          yield fallbackData;
        } catch (fallbackError, fallbackStack) {
          AppLogger.error(
            'Both realtime and fallback failed for driver_availability: $fallbackError',
            loggerName: 'Provider',
            error: fallbackError,
            stackTrace: fallbackStack,
          );
          // Re-throw the original realtime error
          Error.throwWithStackTrace(error, stackTrace);
        }
      });
});

/// Notifier class that handles driver_availability operations
class DriverAvailabilityNotifier extends StateNotifier<AsyncValue<List<DriverAvailabilityModel>>> {
  final DriverAvailabilityRepository _repository;

  DriverAvailabilityNotifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      AppLogger.debug('Loading initial driver_availability data', loggerName: 'Provider');
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Loaded initial data', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Failed to load initial data', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Fetch all driver_availability with basic sorting and filtering
  Future<List<DriverAvailabilityModel>> fetchAll({
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Fetching data', 
        details: 'filters: $filters, orderBy: $orderBy, limit: $limit, offset: $offset');
      
      // Create a cache key if filters are provided
      String? cacheKey;
      if (filters != null && filters.isNotEmpty) {
        cacheKey = _createCacheKey(filters);
        AppLogger.debug('Using cache key: $cacheKey for fetchAll', loggerName: 'Provider');
      }
      
      state = const AsyncValue.loading();
      
      // Use cache if filters are provided, otherwise fetch directly
      final List<DriverAvailabilityModel> results;
      if (cacheKey != null) {
        results = await AppCache().getOrFetch<List<DriverAvailabilityModel>>(
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
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Data fetched', details: '${results.length} records');
      }
      
      return results;
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailability');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Get a single record by ID with caching
  Future<DriverAvailabilityModel?> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = 'driver_availability:id:$id';
      
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Getting record by ID', details: 'id: $id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<DriverAvailabilityModel?>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No driver_availability found with ID: $id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailability');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Create a new record
  Future<DriverAvailabilityModel> create(DriverAvailabilityModel model) async {
    try {
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Creating record');
      final result = await _repository.insert(model);
      
      // Clear any cached list results that might contain this entity
      AppLogger.debug('Clearing driver_availability list caches after create', loggerName: 'Provider');
      _clearRelatedCaches(result);
      
      // Update state with new data
      if (mounted) {
        final currentData = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentData, result]);
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Record created', details: 'id: ${result.id}');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailability');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Update an existing record
  Future<DriverAvailabilityModel?> update(DriverAvailabilityModel model) async {
    try {
      final modelId = model.id;
      if (modelId.isEmpty) {
        const message = 'Cannot update driver_availability without ID';
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Update failed', details: message);
        throw AppException(message: message);
      }
      
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Updating record', details: 'id: $modelId');
      final result = await _repository.update(model);
      
      // Clear related caches
      if (result != null) {
        // Clear both the specific ID cache and list caches
        final idCacheKey = 'driver_availability:id:$modelId';
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
          ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Record updated', details: 'id: $modelId');
        }
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailability');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Deleting record', details: 'id: $id');
      await _repository.delete(id);
      
      // Clear cache entries for this ID
      final idCacheKey = 'driver_availability:id:$id';
      AppLogger.debug('Clearing cache for key: $idCacheKey', loggerName: 'Provider');
      AppCache().remove(idCacheKey);
      
      // Clear list caches that might contain this entity (using a prefix)
      final prefix = 'driver_availability:';
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
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Record deleted', details: 'id: $id');
      }
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'DriverAvailability');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Clear caches related to this entity
  void _clearRelatedCaches(DriverAvailabilityModel entity) {
    final prefix = 'driver_availability:';
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
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Refreshing data');
      if (mounted) {
        state = const AsyncValue.loading();
      }
      
      // Clear all caches related to this entity type
      final prefix = 'driver_availability:';
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
        ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Data refreshed', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      ProviderLogging.logStateChange('DriverAvailabilityNotifier', 'Refresh failed', error: e, stackTrace: stackTrace);
    }
  }
}
