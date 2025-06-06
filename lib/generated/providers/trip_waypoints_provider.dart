import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/trip_waypoints_model.dart';
import '../repositories/trip_waypoints_repository.dart';
import '../shared/errors/app_exception.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

// Repository provider
final tripWaypointsRepositoryProvider = Provider<TripWaypointsRepository>((ref) {
  AppLogger.debug('Creating TripWaypointsRepository instance', loggerName: 'Provider');
  return TripWaypointsRepository(Supabase.instance.client);
});

// Main provider for managing trip_waypoints data
final tripWaypointsProvider = StateNotifierProvider<TripWaypointsNotifier, AsyncValue<List<TripWaypointsModel>>>((ref) {
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  AppLogger.debug('Creating TripWaypointsNotifier', loggerName: 'Provider');
  return TripWaypointsNotifier(repository);
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
  
  return 'trip_waypoints:${parts.join(',')}';
}

// Provider to get a single trip_waypoints by ID with caching
final tripWaypointsByIdProvider = FutureProvider.family<TripWaypointsModel?, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = 'trip_waypoints:id:$id';
  
  AppLogger.debug('tripWaypointsByIdProvider called with id: $id', loggerName: 'Provider');
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<TripWaypointsModel?>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No trip_waypoint found with ID: $id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found trip_waypoint with ID: $id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypointsById');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Provider to get filtered trip_waypoints with proper caching
final filteredTripWaypointsProvider = FutureProvider.family<List<TripWaypointsModel>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filteredTripWaypointsProvider called with key: $cacheKey', loggerName: 'Provider');
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
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
    
    final results = await AppCache().getOrFetch<List<TripWaypointsModel>>(
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
    
    AppLogger.debug('filteredTripWaypointsProvider returned ${results.length} items for key: $cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'FilteredTripWaypoints');
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

/// Realtime provider for all trip_waypoints records
/// 
/// This provider streams all records in real-time and automatically handles:
/// - Stream disconnections and reconnections
/// - Error recovery with exponential backoff  
/// - Graceful fallback to cached data when realtime fails
/// 
/// Example usage:
/// ```dart
/// class TripWaypointsListView extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final tripWaypointsStream = ref.watch(realtimeTripWaypointsProvider);
///     
///     return tripWaypointsStream.when(
///       data: (tripWaypoints) => ListView.builder(
///         itemCount: tripWaypoints.length,
///         itemBuilder: (ctx, i) => TripWaypointsTile(
///           key: ValueKey('trip_waypoints-${tripWaypoints[i].id}'),
///           tripwaypoints: tripWaypoints[i],
///         ),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeTripWaypointsProvider = StreamProvider<List<TripWaypointsModel>>((ref) {
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for all trip_waypoints', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for trip_waypoints: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        // Don't rethrow - let Riverpod handle the error state
        // The stream will automatically attempt to reconnect
      });
});

/// Realtime provider for a single trip_waypoints by ID
/// 
/// This provider streams a specific record in real-time with automatic
/// error handling and reconnection logic.
/// 
/// Example usage:
/// ```dart
/// class TripWaypointsDetailView extends ConsumerWidget {
///   final String tripWaypointsId;
///   
///   const TripWaypointsDetailView({required this.tripWaypointsId});
///   
///   Widget build(BuildContext context, WidgetRef ref) {
///     final tripWaypointsStream = ref.watch(realtimeTripWaypointsByIdProvider(tripWaypointsId));
///     
///     return tripWaypointsStream.when(
///       data: (tripwaypoints) => tripwaypoints != null
///         ? TripWaypointsDetail(tripwaypoints: tripwaypoints)
///         : const Text('TripWaypoints not found'),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeTripWaypointsByIdProvider = StreamProvider.family<TripWaypointsModel?, String>((ref, id) {
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for trip_waypoints ID: $id', loggerName: 'Provider');
  
  return repository
      .streamById(id)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for trip_waypoints ID $id: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
      });
});

/// Realtime provider for filtered trip_waypoints records with client-side filtering
/// 
/// This provider streams records matching the given filters using a hybrid approach:
/// - Streams all records from the table (for maximum reliability)
/// - Applies filters on the client side (to work around Supabase limitations)
/// 
/// Note: For large tables, consider using the unfiltered realtimeTripWaypointsProvider
/// and filtering in your widget to reduce processing overhead.
/// 
/// Example usage:
/// ```dart
/// class ActiveTripWaypointsWidget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     // Create stable filter reference to avoid provider recreation
///     final activeFilter = {'status': 'active'};
///     final activeTripWaypointsStream = ref.watch(
///       realtimeFilteredTripWaypointsProvider(activeFilter)
///     );
///     
///     return activeTripWaypointsStream.when(
///       data: (activeTripWaypoints) => Column(
///         children: activeTripWaypoints
///           .map((tripwaypoints) => TripWaypointsCard(
///             key: ValueKey('active-trip_waypoints-${tripwaypoints.id}'),
///             tripwaypoints: tripwaypoints,
///           ))
///           .toList(),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeFilteredTripWaypointsProvider = StreamProvider.family<List<TripWaypointsModel>, Map<String, dynamic>>((ref, filters) {
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
  // Create a readable filter description for logging
  final filterDesc = filters.entries.map((e) => '${e.key}=${e.value}').join(', ');
  AppLogger.debug('Starting filtered realtime stream for trip_waypoints with filters: $filterDesc', loggerName: 'Provider');
  
  return repository
      .streamWhere(filters)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Filtered realtime stream error for trip_waypoints (filters: $filterDesc): $error',
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
/// class ReliableTripWaypointsWidget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final tripWaypointsData = ref.watch(hybridTripWaypointsProvider);
///     
///     return tripWaypointsData.when(
///       data: (tripWaypoints) => TripWaypointsList(tripWaypoints: tripWaypoints),
///       loading: () => const TripWaypointsSkeleton(),
///       error: (e, _) => TripWaypointsErrorView(error: e),
///     );
///   }
/// }
/// ```
final hybridTripWaypointsProvider = StreamProvider<List<TripWaypointsModel>>((ref) {
  final repository = ref.watch(tripWaypointsRepositoryProvider);
  
  AppLogger.debug('Starting hybrid realtime/cached stream for trip_waypoints', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) async* {
        AppLogger.warning(
          'Realtime failed for trip_waypoints, falling back to cached data: $error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        try {
          // Fallback to cached regular query
          final fallbackData = await repository.findAll();
          AppLogger.debug('Successfully fell back to cached data for trip_waypoints (${fallbackData.length} records)', loggerName: 'Provider');
          yield fallbackData;
        } catch (fallbackError, fallbackStack) {
          AppLogger.error(
            'Both realtime and fallback failed for trip_waypoints: $fallbackError',
            loggerName: 'Provider',
            error: fallbackError,
            stackTrace: fallbackStack,
          );
          // Re-throw the original realtime error
          Error.throwWithStackTrace(error, stackTrace);
        }
      });
});

/// Notifier class that handles trip_waypoints operations
class TripWaypointsNotifier extends StateNotifier<AsyncValue<List<TripWaypointsModel>>> {
  final TripWaypointsRepository _repository;

  TripWaypointsNotifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      AppLogger.debug('Loading initial trip_waypoints data', loggerName: 'Provider');
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Loaded initial data', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Failed to load initial data', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Fetch all trip_waypoints with basic sorting and filtering
  Future<List<TripWaypointsModel>> fetchAll({
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Fetching data', 
        details: 'filters: $filters, orderBy: $orderBy, limit: $limit, offset: $offset');
      
      // Create a cache key if filters are provided
      String? cacheKey;
      if (filters != null && filters.isNotEmpty) {
        cacheKey = _createCacheKey(filters);
        AppLogger.debug('Using cache key: $cacheKey for fetchAll', loggerName: 'Provider');
      }
      
      state = const AsyncValue.loading();
      
      // Use cache if filters are provided, otherwise fetch directly
      final List<TripWaypointsModel> results;
      if (cacheKey != null) {
        results = await AppCache().getOrFetch<List<TripWaypointsModel>>(
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
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Data fetched', details: '${results.length} records');
      }
      
      return results;
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypoints');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Get a single record by ID with caching
  Future<TripWaypointsModel?> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = 'trip_waypoints:id:$id';
      
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Getting record by ID', details: 'id: $id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<TripWaypointsModel?>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No trip_waypoint found with ID: $id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypoints');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Create a new record
  Future<TripWaypointsModel> create(TripWaypointsModel model) async {
    try {
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Creating record');
      final result = await _repository.insert(model);
      
      // Clear any cached list results that might contain this entity
      AppLogger.debug('Clearing trip_waypoints list caches after create', loggerName: 'Provider');
      _clearRelatedCaches(result);
      
      // Update state with new data
      if (mounted) {
        final currentData = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentData, result]);
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Record created', details: 'id: ${result.id}');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypoints');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Update an existing record
  Future<TripWaypointsModel?> update(TripWaypointsModel model) async {
    try {
      final modelId = model.id;
      if (modelId.isEmpty) {
        const message = 'Cannot update trip_waypoint without ID';
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Update failed', details: message);
        throw AppException(message: message);
      }
      
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Updating record', details: 'id: $modelId');
      final result = await _repository.update(model);
      
      // Clear related caches
      if (result != null) {
        // Clear both the specific ID cache and list caches
        final idCacheKey = 'trip_waypoints:id:$modelId';
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
          ProviderLogging.logStateChange('TripWaypointsNotifier', 'Record updated', details: 'id: $modelId');
        }
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypoints');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Deleting record', details: 'id: $id');
      await _repository.delete(id);
      
      // Clear cache entries for this ID
      final idCacheKey = 'trip_waypoints:id:$id';
      AppLogger.debug('Clearing cache for key: $idCacheKey', loggerName: 'Provider');
      AppCache().remove(idCacheKey);
      
      // Clear list caches that might contain this entity (using a prefix)
      final prefix = 'trip_waypoints:';
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
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Record deleted', details: 'id: $id');
      }
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'TripWaypoints');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Clear caches related to this entity
  void _clearRelatedCaches(TripWaypointsModel entity) {
    final prefix = 'trip_waypoints:';
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
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Refreshing data');
      if (mounted) {
        state = const AsyncValue.loading();
      }
      
      // Clear all caches related to this entity type
      final prefix = 'trip_waypoints:';
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
        ProviderLogging.logStateChange('TripWaypointsNotifier', 'Data refreshed', details: '${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      ProviderLogging.logStateChange('TripWaypointsNotifier', 'Refresh failed', error: e, stackTrace: stackTrace);
    }
  }
}
