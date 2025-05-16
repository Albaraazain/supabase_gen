/// # Type-Safe Query Builders
/// 
/// This guide explains how to use the generated type-safe query builders to interact
/// with your database in a safe and efficient way.
/// 
/// ## What are Query Builders?
/// 
/// Query builders are fluent interfaces that allow you to construct database queries
/// with compile-time type safety. Instead of writing raw SQL or using string-based
/// queries, you can build queries using method chains that are specific to your
/// database schema.
/// 
/// Benefits:
/// - **Type Safety**: Catches typos and type errors at compile time
/// - **Autocompletion**: IDE suggests available columns and methods
/// - **Self-documenting**: Method names clearly express filtering and ordering intent
/// - **Maintainable**: Schema changes cause compile errors rather than runtime errors
/// 
/// ## Getting Started
/// 
/// Each repository provides a `query()` method that returns a type-safe query builder:
/// 
/// ```dart
/// // Get a reference to the repository
/// final userRepository = UserRepository(supabaseClient);
/// 
/// // Create a query builder
/// final queryBuilder = userRepository.query();
/// ```
/// 
/// ## Building Queries
/// 
/// ### Filtering
/// 
/// For each column in your table, the query builder provides type-safe filter methods:
/// 
/// ```dart
/// // Equality filters
/// queryBuilder.whereUsernameEquals('johndoe');
/// 
/// // Range filters (for numeric and date columns)
/// queryBuilder.whereAgeGreaterThan(18);
/// queryBuilder.whereCreatedAtLessThanOrEqual(DateTime.now());
/// queryBuilder.whereScoreBetween(80, 100);
/// 
/// // List filters (IN operator)
/// queryBuilder.whereStatusIn(['active', 'pending']);
/// ```
/// 
/// ### Sorting
/// 
/// Each column also has sorting methods:
/// 
/// ```dart
/// // Sort by created_at in descending order (newest first)
/// queryBuilder.orderByCreatedAtDesc();
/// 
/// // Sort by name in ascending order (A-Z)
/// queryBuilder.orderByNameAsc();
/// ```
/// 
/// ### Pagination
/// 
/// ```dart
/// // Limit results
/// queryBuilder.limit(10);
/// 
/// // Range-based pagination (from index 20 to 29)
/// queryBuilder.range(20, 29);
/// ```
/// 
/// ### Executing Queries
/// 
/// Once you've built your query, you can execute it with one of these methods:
/// 
/// ```dart
/// // Get all results as a list
/// final users = await queryBuilder.get();
/// 
/// // Get a single result or null
/// final user = await queryBuilder.getSingle();
/// 
/// // Count the results
/// final count = await queryBuilder.count();
/// ```
/// 
/// ## Combining Methods
/// 
/// You can chain methods to build complex queries:
/// 
/// ```dart
/// final activeAdminUsers = await userRepository
///   .query()
///   .whereRoleEquals('admin')
///   .whereStatusEquals('active')
///   .whereLastLoginGreaterThan(DateTime.now().subtract(Duration(days: 30)))
///   .orderByUsernameAsc()
///   .limit(20)
///   .get();
/// ```
/// 
/// ## Best Practices
/// 
/// 1. **Reuse query builders** for similar queries to improve code readability:
/// 
/// ```dart
/// UserQueryBuilder activeUsersQuery() {
///   return userRepository
///     .query()
///     .whereStatusEquals('active')
///     .whereEmailVerifiedEquals(true);
/// }
/// 
/// // Later in your code:
/// final recentActiveUsers = await activeUsersQuery()
///   .whereLastLoginGreaterThan(lastMonth)
///   .get();
/// ```
/// 
/// 2. **Prefer query builders** over direct repository methods for complex queries
/// 
/// 3. **Use typed results** to benefit from autocompletion on the returned models
/// 
/// ```dart
/// final List<UserModel> users = await userRepository
///   .query()
///   .whereAgeGreaterThan(18)
///   .get();
/// ```
/// 
/// ## Advanced Techniques
/// 
/// ### Custom Queries
/// 
/// For advanced cases, you can still use the base Supabase client directly:
/// 
/// ```dart
/// final customResult = await supabaseClient
///   .from('users')
///   .select('*, profiles(*)')
///   .eq('status', 'active');
/// ```
/// 
/// ## Error Handling
/// 
/// Query builder methods throw exceptions on errors:
/// 
/// ```dart
/// try {
///   final users = await userRepository
///     .query()
///     .whereAgeGreaterThan(18)
///     .get();
/// } catch (e) {
///   // Handle database errors
///   print('Query failed: $e');
/// }
/// ```
/// 
/// ## Performance Considerations
/// 
/// - Add appropriate indexes for columns used in filters and sorting
/// - Use limits and pagination for large result sets
/// - Consider using count() with exact:false for large tables when approximate counts are sufficient
/// 