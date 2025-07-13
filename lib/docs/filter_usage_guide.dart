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
///     key: ValueKey('user-${users[i].id}'),
///     user: users[i],
///   ),
/// )
/// ```
