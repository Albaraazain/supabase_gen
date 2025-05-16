// Templates for generating cache utilities
import 'package:recase/recase.dart';

/// Templates for generating cache utilities for Supabase Gen
class CacheTemplate {
  /// Generate a robust caching utility
  static String cacheUtility() {
    return '''import 'dart:async';
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
        'Removed \${expiredKeys.length} expired cache entries',
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
        'Type mismatch for cache key "\$key": expected \$T but got \${entry.value.runtimeType}',
        loggerName: 'AppCache',
      );
      return null;
    }
    
    // Cache hit
    AppLogger.debug('Cache hit for key "\$key"', loggerName: 'AppCache');
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
        'Cache full, removed oldest entry: "\${oldest.key}"',
        loggerName: 'AppCache',
      );
    }
    
    final expiresAt = DateTime.now().add(duration ?? defaultDuration);
    _cache[key] = _CacheEntry(value, DateTime.now(), expiresAt);
    
    AppLogger.debug(
      'Cached value for key "\$key", expires at \${expiresAt.toIso8601String()}',
      loggerName: 'AppCache',
    );
  }

  /// Remove a value from the cache
  void remove(String key) {
    _cache.remove(key);
    AppLogger.debug('Removed cache entry for key "\$key"', loggerName: 'AppCache');
  }

  /// Clear the entire cache
  void clear() {
    _cache.clear();
    AppLogger.debug('Cache cleared', loggerName: 'AppCache');
  }

  /// Get a value from the cache or compute it if not present
  /// This is useful for "fetch or cache" patterns in repositories
  Future<T> getOrFetch<T>(
    String key,
    Future<T> Function() fetchFn, {
    Duration? duration,
    bool forceRefresh = false,
  }) async {
    // Check if in cache and not forcing refresh
    if (!forceRefresh) {
      final cachedValue = get<T>(key);
      if (cachedValue != null) {
        return cachedValue;
      }
    }

    // Not in cache or forced refresh, compute the value
    AppLogger.debug('Cache miss for key "\$key", fetching...', loggerName: 'AppCache');
    try {
      final value = await fetchFn();
      // Store in cache
      set<T>(key, value, duration: duration);
      return value;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching value for cache key "\$key"',
        loggerName: 'AppCache',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  
  /// Build a compound cache key from multiple parts
  /// This is useful for creating keys based on filters, parameters, etc.
  static String buildKey(String prefix, [List<Object?> parts = const []]) {
    if (parts.isEmpty) {
      return prefix;
    }

    return '\$prefix:\${parts.map((p) => p?.toString() ?? 'null').join(':')}';
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
''';
  }

  /// Generate a method for creating stable cache keys from filters
  static String cacheKeyGenerator(String entityName) {
    return '''
/// Helper to create a stable cache key from filters
String _createCacheKey(Map<String, dynamic> filters) {
  // Sort the keys to ensure consistent ordering
  final sortedKeys = filters.keys.toList()..sort();
  final parts = <String>[];
  
  for (final key in sortedKeys) {
    final value = filters[key];
    parts.add('\$key=\${value?.toString() ?? 'null'}');
  }
  
  return '${entityName.snakeCase}:\${parts.join(',')}';
}
''';
  }

  /// Generate a method stub for creating cache instructions in documentation
  static String cacheUsageDocumentation() {
    return '''
/// # Caching Best Practices
/// 
/// When using providers, especially family providers, follow these best practices:
/// 
/// 1. Create stable references for filter objects:
///    ```dart
///    // BAD: Creates a new object on every build
///    filteredProvider({'id': itemId})
///    
///    // GOOD: Use a stable reference created in initState
///    late final Map<String, dynamic> _filter = {'id': widget.itemId};
///    filteredProvider(_filter)
///    ```
/// 
/// 2. Use select() to minimize rebuilds:
///    ```dart
///    // Rebuilds for any change in the AsyncValue
///    ref.watch(myProvider(id))
///    
///    // Rebuilds only for specific properties or state changes
///    ref.watch(myProvider(id).select((value) => value))
///    ```
/// 
/// 3. Add proper keys to list items:
///    ```dart
///    ListView.builder(
///      itemBuilder: (ctx, i) => MyItem(
///        key: ValueKey('item-\${items[i].id}'),
///        item: items[i],
///      ),
///    )
///    ```
/// 
/// 4. Consider using Column instead of nested ListView for small lists:
///    ```dart
///    // Better for small, known lists to avoid nested scrolling issues
///    Column(
///      children: items.map((item) => MyItem(item: item)).toList(),
///    )
///    ```
''';
  }
}