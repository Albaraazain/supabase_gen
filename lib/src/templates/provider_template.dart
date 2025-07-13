// Templates for generating Riverpod providers

class ProviderTemplate {
  /// Generate the main provider notifier class for a table
  /// using a non-annotation approach that doesn't require code generation
  static String notifierClass({
    required String tableName,
    required String pascalCaseTableName,
    required String modelName,
    required String repositoryName,
    required String camelCaseTableName,
    bool useAppException = false,
    bool useNullSafety = true,
  }) {
    final exceptionType = useAppException ? 'AppException' : 'Exception';
    final importAppException =
        useAppException
            ? "import '../shared/errors/app_exception.dart';\n"
            : '';
    final importAppExceptionHandler =
        useAppException
            ? "import '../shared/errors/app_exception_handler.dart';\n"
            : '';

    // Add nullability modifiers based on configuration
    final nullableMark = useNullSafety ? '?' : '';

    return '''import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/${tableName}_model.dart';
import '../repositories/${tableName}_repository.dart';
$importAppException
$importAppExceptionHandler
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

// Repository provider
final ${camelCaseTableName}RepositoryProvider = Provider<$repositoryName>((ref) {
  return $repositoryName(Supabase.instance.client);
});

// Main provider for managing $tableName data
final ${camelCaseTableName}Provider = StateNotifierProvider<${pascalCaseTableName}Notifier, AsyncValue<List<$modelName>>>((ref) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  return ${pascalCaseTableName}Notifier(repository);
});

// Provider to get a single $tableName by ID with caching
final ${camelCaseTableName}ByIdProvider = FutureProvider.family<$modelName$nullableMark, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = '${tableName}:id:\$id';
  
  AppLogger.debug('${camelCaseTableName}ByIdProvider called with id: \$id', loggerName: 'Provider');
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<$modelName$nullableMark>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No ${_singularize(tableName)} found with ID: \$id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found ${_singularize(tableName)} with ID: \$id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}ById');
    throw $exceptionType(
      ${useAppException ? 'message: ' : ''}'Failed to get ${_singularize(tableName)} details: \$errorMsg',
      ${useAppException ? 'originalError: e' : ''},
    );
  }
});

// Provider to get filtered ${tableName} with proper caching
final filtered${pascalCaseTableName}Provider = FutureProvider.family<List<$modelName>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filtered${pascalCaseTableName}Provider called with key: \$cacheKey', loggerName: 'Provider');
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant calls
    final results = await AppCache().getOrFetch<List<$modelName>>(
      cacheKey,
      () => repository.findAll(filters: filters),
      duration: const Duration(seconds: 30), // Short cache time to stay fresh
    );
    
    AppLogger.debug('filtered${pascalCaseTableName}Provider returned \${results.length} items for key: \$cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'Filtered${pascalCaseTableName}');
    throw $exceptionType(
      ${useAppException ? 'message: ' : ''}'Failed to load filtered ${tableName}: \$errorMsg',
      ${useAppException ? 'originalError: e' : ''},
    );
  }
});

// Helper to create a stable cache key from filters
String _createCacheKey(Map<String, dynamic> filters) {
  // Sort the keys to ensure consistent ordering
  final sortedKeys = filters.keys.toList()..sort();
  final parts = <String>[];
  
  for (final key in sortedKeys) {
    final value = filters[key];
    parts.add('\$key=\${value?.toString() ?? 'null'}');
  }
  
  return '${tableName}:\${parts.join(',')}';
}

/// Notifier class that handles ${tableName} operations
class ${pascalCaseTableName}Notifier extends StateNotifier<AsyncValue<List<$modelName>>> {
  final $repositoryName _repository;

  ${pascalCaseTableName}Notifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
      }
    } catch (e) {
      if (mounted) {
        state = AsyncValue.error(e, StackTrace.current);
      }
    }
  }

  /// Fetch all $tableName with basic sorting and filtering
  Future<List<$modelName>> fetchAll({
    String$nullableMark orderBy,
    bool ascending = true,
    Map<String, dynamic>$nullableMark filters,
    int$nullableMark limit,
    int$nullableMark offset,
  }) async {
    try {
      state = const AsyncValue.loading();
      final results = await _repository.findAll(
        orderBy: orderBy,
        ascending: ascending,
        filters: filters,
        limit: limit,
        offset: offset,
      );
      state = AsyncValue.data(results);
      return results;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw $exceptionType(
        ${useAppException ? 'message: ' : ''}'Failed to load $tableName: \$e',
      );
    }
  }
  
  /// Get a single record by ID with caching
  Future<$modelName$nullableMark> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = '${tableName}:id:\$id';
      
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Getting record by ID', details: 'id: \$id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<$modelName$nullableMark>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No ${_singularize(tableName)} found with ID: \$id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw $exceptionType(
        ${useAppException ? 'message: ' : ''}'Failed to get ${_singularize(tableName)} details: \$errorMsg',
        ${useAppException ? 'originalError: e' : ''},
      );
    }
  }
  
  /// Create a new record
  Future<$modelName> create($modelName model) async {
    try {
      final result = await _repository.insert(model);
      
      // Update state with new data
      final currentData = state.valueOrNull ?? [];
      state = AsyncValue.data([...currentData, result]);
      
      return result;
    } catch (e) {
      throw $exceptionType(
        ${useAppException ? 'message: ' : ''}'Failed to create ${_singularize(tableName)}: \$e',
      );
    }
  }
  
  /// Update an existing record
  Future<$modelName$nullableMark> update($modelName model) async {
    try {
      final modelId = model.id;
      if (modelId == null) {
        throw $exceptionType(
          ${useAppException ? 'message: ' : ''}'Cannot update ${_singularize(tableName)} without ID',
        );
      }
      
      final result = await _repository.update(model);
      
      // Update state if successful
      if (result != null && state.hasValue) {
        final currentList = state.value!;
        final index = currentList.indexWhere((item) => item.id == modelId);
        
        if (index >= 0) {
          final updated = [...currentList];
          updated[index] = result;
          state = AsyncValue.data(updated);
        }
      }
      
      return result;
    } catch (e) {
      throw $exceptionType(
        ${useAppException ? 'message: ' : ''}'Failed to update ${_singularize(tableName)}: \$e',
      );
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      await _repository.delete(id);
      
      // Update state if successful
      if (state.hasValue) {
        final currentList = state.value!;
        final idValue = int.tryParse(id) ?? id;
        state = AsyncValue.data(
          currentList.where((item) => item.id.toString() != id).toList(),
        );
      }
    } catch (e) {
      throw $exceptionType(
        ${useAppException ? 'message: ' : ''}'Failed to delete ${_singularize(tableName)}: \$e',
      );
    }
  }
}
''';
  }

  /// Helper method to get singular form of a word
  static String _singularize(String word) {
    if (word.endsWith('ies')) {
      return '${word.substring(0, word.length - 3)}y';
    } else if (word.endsWith('es')) {
      return word.substring(0, word.length - 2);
    } else if (word.endsWith('s') && !word.endsWith('ss')) {
      return word.substring(0, word.length - 1);
    }
    return word;
  }

  /// Generate relationship-specific provider method
  static String relationshipMethod({
    required String relationshipType,
    required String tableName,
    required String modelName,
    required String relatedTable,
    required String relatedModel,
    required String columnName,
    bool useNullSafety = true,
  }) {
    final relatedTableCamel = relatedTable.toLowerCase();
    final relatedTablePascal =
        '${relatedTable[0].toUpperCase()}${relatedTable.substring(1)}';

    // Define exception type
    final exceptionType = 'AppException';

    if (relationshipType == 'manyToOne') {
      return '''
  /// Get $modelName records related to a specific $relatedTable
  Future<List<$modelName>> getBy${relatedTablePascal}Id(String ${relatedTableCamel}Id) async {
    try {
      if (${relatedTableCamel}Id.isEmpty) {
        throw $exceptionType(
          message: 'Cannot get $tableName with empty ${relatedTableCamel}Id',
        );
      }
      
      return await fetchAll(
        filters: {'$columnName': ${relatedTableCamel}Id},
      );
    } catch (e) {
      throw $exceptionType(
        message: 'Failed to get $tableName by ${relatedTableCamel}Id: \$e',
      );
    }
  }''';
    } else if (relationshipType == 'oneToMany') {
      return '''
  /// Get $relatedModel records related to this $modelName
  Future<List<$relatedModel>> get${relatedTablePascal}s(String id) async {
    try {
      if (id.isEmpty) {
        throw $exceptionType(
          message: 'Cannot get related $relatedTable with empty id',
        );
      }
      
      final repository = ${relatedTablePascal}Repository(Supabase.instance.client);
      return await repository.findAll(
        filters: {'$columnName': id},
      );
    } catch (e) {
      throw $exceptionType(
        message: 'Failed to get related $relatedTable: \$e',
      );
    }
  }''';
    }

    return '';
  }

  /// Generate a family provider for filtered queries
  static String familyProvider({
    required String tableName,
    required String pascalCaseTableName,
    required String modelName,
    required String filterField,
    required String filterType,
    bool useNullSafety = true,
  }) {
    final methodName =
        'get${pascalCaseTableName}By${filterField[0].toUpperCase()}${filterField.substring(1)}';
    final nullableMark = useNullSafety ? '?' : '';

    return '''
/// Provider for getting $tableName filtered by $filterField
@riverpod
Future<List<$modelName>> $methodName(
  ${pascalCaseTableName}By${filterField[0].toUpperCase()}${filterField.substring(1)}Ref ref,
  $filterType$nullableMark value,
) async {
  final notifier = ref.watch(${tableName}NotifierProvider.notifier);
  
  // Handle null or empty value
  if (value == null${filterType == 'String' ? ' || (value as String).isEmpty' : ''}) {
    // Return empty list for null/empty values or handle as needed
    return [];
  }
  
  return notifier.fetchAll(filters: {'$filterField': value});
}
''';
  }

  /// Generate AppException class template
  static String appExceptionClass() {
    return '''/// Standard exception class for application errors
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => 'AppException: \$message\${code != null ? " (code: \$code)" : ""}';
}
''';
  }

  /// Generate extended AsyncValue widget integration code
  static String asyncValueWidgetIntegration(bool useNullSafety) {
    // Add nullability modifiers based on configuration
    final nullableMark = useNullSafety ? '?' : '';

    return '''// Integration with AsyncValueWidget for easy UI consumption

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget to simplify handling async states in the UI
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value, 
    required this.data, 
    super.key,
    this.loading,
    this.error,
    this.onRetry,
    this.isEmpty,
    this.emptyWidget,
  });

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function()$nullableMark loading;
  final Widget Function(Object, StackTrace$nullableMark, VoidCallback$nullableMark)$nullableMark error;
  final VoidCallback$nullableMark onRetry;
  final bool Function(T)$nullableMark isEmpty;
  final Widget$nullableMark emptyWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (value) {
        if (isEmpty != null && isEmpty!(value)) {
          return emptyWidget ?? const Center(child: Text('No data available'));
        }
        return data(value);
      },
      loading: loading ?? () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => this.error != null
          ? this.error!(error, stackTrace, onRetry)
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Error: \$error'),
                  if (onRetry != null)
                    ElevatedButton(
                      onPressed: onRetry,
                      child: const Text('Retry'),
                    ),
                ],
              ),
            ),
    );
  }
}
''';
  }

  /// Generate usage example
  static String usageExample({
    required String tableName,
    required String pascalCaseTableName,
    required String modelName,
    bool useNullSafety = true,
  }) {
    // Add nullability modifiers based on configuration
    final nullableMark = useNullSafety ? '?' : '';

    return '''// Example usage in a screen

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${tableName}_model.dart';
import '../providers/${tableName}_provider.dart';
import '../shared/widgets/async_value_widget.dart';

class ${pascalCaseTableName}Screen extends ConsumerWidget {
  const ${pascalCaseTableName}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get data from the provider
    final ${tableName}Async = ref.watch(${tableName}NotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascalCaseTableName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(${tableName}NotifierProvider),
          ),
        ],
      ),
      body: AsyncValueWidget<List<$modelName>>(
        value: ${tableName}Async,
        data: (${tableName}List) => ListView.builder(
          itemCount: ${tableName}List.length,
          itemBuilder: (context, index) {
            final item = ${tableName}List[index];
            // Safely access properties with null checks
            final title = item.title$nullableMark ?? 'No title';
            return ListTile(
              title: Text(title),
              // Add other fields as needed
              onTap: () {
                // Navigate to detail screen using item.id if available
                if (item.id != null) {
                  // Example navigation
                  // Navigator.pushNamed(context, '/${tableName}_detail', arguments: item.id);
                }
              },
            );
          },
        ),
        isEmpty: (data) => data.isEmpty,
        emptyWidget: const Center(
          child: Text('No $tableName found'),
        ),
        error: (error, stackTrace, retry) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: \$error'),
              if (retry != null)
                ElevatedButton(
                  onPressed: retry,
                  child: const Text('Retry'),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create screen
          // Example: Navigator.pushNamed(context, '/${tableName}_create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
''';
  }
}
