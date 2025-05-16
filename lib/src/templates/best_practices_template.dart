// Template for generating best practices documentation
import '../schema/constraint_metadata.dart';
import '../schema/table_info.dart';

/// Templates for generating best practices documentation
class BestPracticesTemplate {
  /// Generate markdown documentation for a table based on constraints
  static String generateTableDocumentation(
    TableInfo table,
    String modelClassName,
    TableConstraintMetadata constraints
  ) {
    final fields = table.columns.map((column) {
      final name = column.name;
      final type = column.type;
      final nullable = column.isNullable ? 'Yes' : 'No';
      final defaultValue = column.defaultValue ?? 'None';
      
      // Find constraint information
      final isPrimaryKey = column.isPrimaryKey;
      final isUnique = column.isUnique;
      
      // Find matching column constraint
      final columnConstraint = constraints.columns.firstWhere(
        (c) => c.columnName == column.name,
        orElse: () => ColumnConstraintMetadata(
          columnName: column.name,
          isNullable: column.isNullable,
          isUnique: false,
          isPrimaryKey: false,
          dartType: 'String',
        ),
      );
      
      // Find foreign key if any
      final foreignKey = constraints.foreignKeys.firstWhere(
        (fk) => fk.columnName == column.name,
        orElse: () => ForeignKeyConstraint(
          name: '', 
          columnName: '', 
          referenceTable: '', 
          referenceColumn: '',
        ),
      );
      
      final constraintsList = <String>[];
      if (isPrimaryKey) constraintsList.add('Primary Key');
      if (isUnique && !isPrimaryKey) constraintsList.add('Unique');
      if (!column.isNullable) constraintsList.add('Not Null');
      if (foreignKey.columnName.isNotEmpty) {
        constraintsList.add('Foreign Key → ${foreignKey.referenceTable}(${foreignKey.referenceColumn})');
      }
      
      final constraintsText = constraintsList.isEmpty ? '-' : constraintsList.join(', ');
      
      return '| `$name` | `$type` | $nullable | $defaultValue | $constraintsText |';
    }).join('\n');
    
    // Generate relationships documentation
    final relationships = <String>[];
    
    // One-to-many relationships (foreign keys pointing to this table)
    if (constraints.primaryKey != null) {
      relationships.add('### One-to-Many Relationships\n');
      relationships.add('This table can have multiple related records in these tables:\n');
      // Note: In a real implementation, you'd scan other tables for FKs to this one
      relationships.add('*Relationship information is determined at runtime*\n');
    }
    
    // Many-to-one relationships (foreign keys in this table)
    if (constraints.foreignKeys.isNotEmpty) {
      relationships.add('### Many-to-One Relationships\n');
      relationships.add('This table has references to these parent tables:\n');
      
      for (final fk in constraints.foreignKeys) {
        relationships.add('- **${fk.referenceTable}** via `${fk.columnName}` → `${fk.referenceColumn}`');
      }
    }
    
    // Generate lookup methods documentation
    final lookupMethods = constraints.getLookupMethods();
    final lookupMethodsDocs = lookupMethods.isEmpty 
        ? ''
        : '''### Available Lookup Methods

The following lookup methods are available in the repository:

${lookupMethods.map((m) => '- `${m.methodName}(${m.parameterNames.join(', ')})` - Returns ${m.isUnique ? 'a single' : 'multiple'} record(s)').join('\n')}
''';
    
    return '''# $modelClassName Documentation

## Table: ${table.name}

${table.comment ?? 'No description available for this table.'}

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
$fields

${relationships.join('\n')}

$lookupMethodsDocs

## Usage Example

```dart
// Create a new instance
final ${table.name} = $modelClassName(
  // Add required fields here
);

// Use the repository to save it
final repository = ${table.name.substring(0, 1).toUpperCase() + table.name.substring(1)}Repository(client);
final savedId = await repository.create(${table.name});

// Fetch by ID
final fetched = await repository.getById(savedId);
```
''';
  }
  /// Generate documentation for proper filter usage
  static String filterUsageGuide() {
    return '''
/// # Best Practices for Using Filtered Providers
/// 
/// When using filtered providers with maps like `filteredUsersProvider({'status': 'active'})`,
/// follow these practices to avoid performance issues and excessive rebuilds:
/// 
/// ## 1. Use Stable References for Filter Objects
/// 
/// 💡 **Create the filter object ONCE and reuse it**
/// 
/// ```dart
/// class MyWidget extends ConsumerStatefulWidget {
///   @override
///   ConsumerState<MyWidget> createState() => _MyWidgetState();
/// }
/// 
/// class _MyWidgetState extends ConsumerState<MyWidget> {
///   // ✅ Create a stable reference in the state
///   late final Map<String, dynamic> _filter = {'status': 'active'};
///   
///   @override
///   Widget build(BuildContext context) {
///     // ✅ Use the stable reference
///     final dataAsync = ref.watch(filteredUsersProvider(_filter));
///     
///     return AsyncValueWidget(
///       value: dataAsync,
///       data: (users) => ListView.builder(/* ... */),
///     );
///   }
/// }
/// ```
/// 
/// ❌ **Bad practice - creates a new map on every build:**
/// ```dart
/// // Don't do this - it creates a new object on every build!
/// final dataAsync = ref.watch(
///   filteredUsersProvider({'status': 'active'})
/// );
/// ```
/// 
/// ## 2. Properly Invalidate Provider Caches
/// 
/// When you need to refresh filtered data, invalidate using the *same* filter object:
/// 
/// ```dart
/// // ✅ Good - uses the same reference for invalidation
/// void refreshData() {
///   ref.invalidate(filteredUsersProvider(_filter));
/// }
/// ```
/// 
/// ## 3. Use select() for Selective Rebuilds
/// 
/// ```dart
/// // ✅ Only rebuilds when the value actually changes
/// ref.watch(userProfileProvider(userId).select((value) => value))
/// ```
/// 
/// ## 4. Use Keys for List Items
/// 
/// ```dart
/// ListView.builder(
///   itemCount: users.length,
///   itemBuilder: (ctx, i) => UserListItem(
///     key: ValueKey('user-\${users[i].id}'),
///     user: users[i],
///   ),
/// )
/// ```
''';
  }

  /// Generate documentation for proper UI rebuilding
  static String uiRebuildingGuide() {
    return '''
/// # UI Rebuilding Best Practices
/// 
/// Follow these guidelines to minimize unnecessary rebuilds and optimize performance:
/// 
/// ## 1. Prefer Column Over Nested ListViews for Small Lists
/// 
/// When displaying a small list (less than ~20 items) within a scrollable parent:
/// 
/// ```dart
/// // ✅ Better for small lists to avoid nested scrolling issues
/// Column(
///   children: items.map((item) => 
///     ItemWidget(
///       key: ValueKey('item-\${item.id}'),
///       item: item
///     )
///   ).toList(),
/// )
/// ```
/// 
/// ## 2. Use Proper Keys Throughout
/// 
/// Always provide stable, unique keys for list items:
/// 
/// ```dart
/// // ✅ Good use of keys
/// items.map((item) => ItemWidget(
///   key: ValueKey('\${prefix}-\${item.id}'),
///   item: item,
/// )).toList()
/// ```
/// 
/// ## 3. Choose the Right State Management Approach
/// 
/// - Use `select()` for fine-grained control:
///   ```dart
///   // Only rebuilds when the name changes
///   final userName = ref.watch(
///     userProvider(userId).select((user) => user.name)
///   );
///   ```
/// 
/// - Use Consumer widgets to localize rebuilds:
///   ```dart
///   // Only this widget rebuilds when user changes
///   Consumer(
///     builder: (context, ref, _) {
///       final user = ref.watch(userProvider(userId));
///       return Text(user.name);
///     }
///   )
///   ```
/// 
/// ## 4. Debounce Rapidly Changing UI
/// 
/// For rapidly changing UI or filtering, use debounce techniques:
/// 
/// ```dart
/// Timer? _debounce;
/// 
/// void onSearchChanged(String query) {
///   if (_debounce?.isActive ?? false) _debounce!.cancel();
///   _debounce = Timer(const Duration(milliseconds: 300), () {
///     // Update filter after debounce
///     setState(() {
///       _searchFilter = {'query': query};
///     });
///   });
/// }
/// ```
''';
  }

  /// Generate documentation for UI feedback on loading and errors
  static String userFeedbackGuide() {
    return '''
/// # Providing Proper UI Feedback
/// 
/// Creating a responsive UX by handling loading, errors, and empty states:
/// 
/// ## 1. Use AsyncValueWidget for Consistent Patterns
/// 
/// ```dart
/// AsyncValueWidget<List<User>>(
///   value: usersAsync,
///   data: (users) => users.isEmpty
///     ? const EmptyStateWidget(message: 'No users found')
///     : ListView.builder(/* ... */),
///   loading: () => const LoadingIndicator(),
///   error: (error, stack, retry) => ErrorWidget(
///     message: error.toString(),
///     onRetry: retry,
///   ),
/// )
/// ```
/// 
/// ## 2. Consider Skeleton Loaders
/// 
/// For a better user experience during loading states:
/// 
/// ```dart
/// Widget build(BuildContext context) {
///   final dataAsync = ref.watch(myProvider);
///   
///   return dataAsync.when(
///     data: (data) => MyDataWidget(data: data),
///     loading: () => const MySkeletonLoader(),
///     error: (e, _) => ErrorDisplay(error: e),
///   );
/// }
/// ```
/// 
/// ## 3. Pull-to-Refresh
/// 
/// ```dart
/// RefreshIndicator(
///   onRefresh: () async {
///     // Invalidate the relevant provider
///     ref.invalidate(myProvider);
///     // Wait for the new data to load
///     await ref.read(myProvider.future);
///   },
///   child: ListView(/* ... */),
/// )
/// ```
/// 
/// ## 4. Progressive Loading
/// 
/// ```dart
/// // For initial load
/// final initialDataAsync = ref.watch(myProvider);
/// 
/// // For background refreshes
/// ref.listen<AsyncValue<Data>>(myProvider, (prev, next) {
///   next.whenOrNull(
///     error: (e, _) => showErrorSnackBar(context, e),
///     data: (_) => setState(() => _lastUpdated = DateTime.now()),
///   );
/// });
/// ```
''';
  }
}