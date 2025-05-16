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
///       key: ValueKey('item-${item.id}'),
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
///   key: ValueKey('${prefix}-${item.id}'),
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
