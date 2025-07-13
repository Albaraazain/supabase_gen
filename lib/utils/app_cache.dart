import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'app_logger.dart';

/// A type-safe caching utility to reduce redundant network requests
/// and optimize performance throughout the app
class AppCache {
  static final AppCache _instance = AppCache._internal();
  
  /// Factory constructor to return the singleton instance
  factory AppCache() => _instance;
  
  AppCache._internal() {
    // Initialize timer to clean expired entries periodically
    _startCleanupTimer();
  }

  /// Timer to periodically clean expired entries
  Timer? _cleanupTimer;

  /// Internal cache storage: Key -> (Value, Expiry timestamp)
  final _cache = HashMap<String, _CacheEntry>();
  
  /// Default cache duration
  static const Duration defaultDuration = Duration(minutes: 5);
  
  /// Maximum number of entries in the cache
  static const int _maxEntries = 1000;

  /// Start the cleanup timer to remove expired entries
  void _startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      _removeExpiredEntries();
    });
  }
  
  /// Remove all expired entries from the cache
  void _removeExpiredEntries() {
    final now = DateTime.now();
    final expiredKeys = _cache.keys.where((key) {
      return _cache[key]!.expiresAt.isBefore(now);
    }).toList();
    
    if (expiredKeys.isNotEmpty) {
      for (final key in expiredKeys) {
        _cache.remove(key);
      }
      
      AppLogger.debug(
        'Removed ${expiredKeys.length} expired cache entries',
        loggerName: 'AppCache',
      );
    }
  }

  /// Get a value from the cache by key
  T? get<T>(String key) {
    final entry = _cache[key];

    // Return null if entry doesn't exist
    if (entry == null) {
      return null;
    }

    // Remove if expired
    if (entry.expiresAt.isBefore(DateTime.now())) {
      _cache.remove(key);
      return null;
    }

    // Validate the type
    if (entry.value is! T) {
      AppLogger.warning(
        'Type mismatch for cache key "$key": expected $T but got ${entry.value.runtimeType}',
        loggerName: 'AppCache',
      );
      return null;
    }
    
    // Cache hit
    AppLogger.debug('Cache hit for key "$key"', loggerName: 'AppCache');
    return entry.value as T;
  }

  /// Set a value in the cache with an optional expiration duration
  void set<T>(String key, T value, {Duration? duration}) {
    // Enforce cache size limit by removing oldest entries if needed
    if (_cache.length >= _maxEntries) {
      final oldest = _cache.entries
          .reduce((a, b) => a.value.createdAt.isBefore(b.value.createdAt) ? a : b);
      _cache.remove(oldest.key);
      AppLogger.debug(
        'Cache full, removed oldest entry: "${oldest.key}"',
        loggerName: 'AppCache',
      );
    }
    
    final expiresAt = DateTime.now().add(duration ?? defaultDuration);
    _cache[key] = _CacheEntry(value, DateTime.now(), expiresAt);
    
    AppLogger.debug(
      'Cached value for key "$key", expires at ${expiresAt.toIso8601String()}',
      loggerName: 'AppCache',
    );
  }

  /// Remove a value from the cache
  void remove(String key) {
    _cache.remove(key);
    AppLogger.debug('Removed cache entry for key "$key"', loggerName: 'AppCache');
  }

  /// Clear the entire cache
  void clear() {
    _cache.clear();
    AppLogger.debug('Cache cleared', loggerName: 'AppCache');
  }

  /// Get a value from the cache or compute it if not present
  /// This is useful for "fetch or cache" patterns in repositories
  /// 
  /// Features anti-stalling mechanisms:
  /// - Auto-expires cache entries to prevent stale data
  /// - Background refresh when nearing expiration
  /// - Graceful fallback on background refresh failure
  Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetchFn, {
    Duration? duration,
    Duration? backgroundRefreshThreshold,
    bool forceRefresh = false,
  }) async {
    final effectiveDuration = duration ?? defaultDuration;
    final refreshThreshold = backgroundRefreshThreshold ?? 
        Duration(milliseconds: (effectiveDuration.inMilliseconds * 0.7).round());
    
    // Check if in cache and not forcing refresh
    if (!forceRefresh) {
      final entry = _cache[key];
      if (entry != null) {
        final now = DateTime.now();
        
        // If not expired, return cached value
        if (now.isBefore(entry.expiresAt)) {
          AppLogger.debug('Cache hit for key "$key"', loggerName: 'AppCache');
          
          // Check if we should trigger background refresh
          final refreshTime = entry.expiresAt.subtract(refreshThreshold);
          if (now.isAfter(refreshTime)) {
            AppLogger.debug('Triggering background refresh for key "$key"', loggerName: 'AppCache');
            _backgroundRefresh(key, fetchFn, effectiveDuration);
          }
          
          return entry.value as T;
        } else {
          // Remove expired entry
          _cache.remove(key);
          AppLogger.debug('Removed expired cache entry for key "$key"', loggerName: 'AppCache');
        }
      }
    }

    // Not in cache, expired, or forced refresh - fetch fresh data
    return await _fetchAndCache(key, fetchFn, effectiveDuration);
  }
  
  /// Internal method to fetch data and store in cache
  Future<T> _fetchAndCache<T>(String key, Future<T> Function() fetchFn, Duration duration) async {
    AppLogger.debug('Cache miss for key "$key", fetching...', loggerName: 'AppCache');
    
    try {
      final value = await fetchFn();
      // Store in cache
      set<T>(key, value, duration: duration);
      return value;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching value for cache key "$key"',
        loggerName: 'AppCache',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  
  /// Background refresh to prevent cache staleness
  /// This refreshes cache entries in the background without blocking the UI
  void _backgroundRefresh<T>(String key, Future<T> Function() fetchFn, Duration duration) {
    // Don't block the current request - fire and forget
    _backgroundRefreshInternal(key, fetchFn, duration).catchError((e) {
      // Errors are already handled in _backgroundRefreshInternal
      // This catchError prevents unhandled future exceptions
    });
  }
  
  /// Internal background refresh implementation
  Future<void> _backgroundRefreshInternal<T>(String key, Future<T> Function() fetchFn, Duration duration) async {
    try {
      AppLogger.debug('Starting background refresh for key "$key"', loggerName: 'AppCache');
      
      final freshData = await fetchFn();
      
      // Update cache with fresh data
      set<T>(key, freshData, duration: duration);
      
      AppLogger.debug('Background refresh completed for key "$key"', loggerName: 'AppCache');
    } catch (e, stackTrace) {
      // Don't propagate errors from background refresh
      // Keep the existing cached data to maintain app stability
      AppLogger.warning(
        'Background refresh failed for key "$key": $e', 
        loggerName: 'AppCache',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
  
  /// Build a compound cache key from multiple parts
  /// This is useful for creating keys based on filters, parameters, etc.
  static String buildKey(String prefix, [List<Object?> parts = const []]) {
    if (parts.isEmpty) {
      return prefix;
    }

    return '$prefix:${parts.map((p) => p?.toString() ?? 'null').join(':')}';
  }

  /// Size of the cache
  int get size => _cache.length;
  
  /// Get an unmodifiable map of all cache keys and their expiration times
  /// Useful for debugging and monitoring cache state
  UnmodifiableMapView<String, DateTime> get expirations {
    return UnmodifiableMapView(
      Map.fromEntries(_cache.entries.map(
        (entry) => MapEntry(entry.key, entry.value.expiresAt),
      )),
    );
  }
  
  /// Dispose of resources
  void dispose() {
    _cleanupTimer?.cancel();
    _cleanupTimer = null;
    _cache.clear();
  }
}

/// Internal class to store cache entries with expiration time
class _CacheEntry {
  final dynamic value;
  final DateTime createdAt;
  final DateTime expiresAt;

  _CacheEntry(this.value, this.createdAt, this.expiresAt);
}
