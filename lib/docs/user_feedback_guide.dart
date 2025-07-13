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
