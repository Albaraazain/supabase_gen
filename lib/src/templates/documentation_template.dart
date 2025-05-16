// lib/src/templates/documentation_template.dart

/// Template for generating documentation files
class DocumentationTemplate {
  /// Generate a documentation file with proper library directive
  static String generateDocumentation({
    required String content,
    required String libraryName,
  }) {
    return '''
/// This is generated documentation for $libraryName
library supabase_gen.generated.docs.$libraryName;

$content
''';
  }

  /// Generate the filter usage guide
  static String generateFilterUsageGuide() {
    return generateDocumentation(
      libraryName: 'filter_usage_guide',
      content: '''
// NOTE: The code samples below are for illustration purposes only and not meant to be compiled directly.
// They demonstrate patterns and best practices but may reference types not defined in this package.
# Best Practices for Using Filtered Providers

When using filtered providers with maps like `filteredUsersProvider({'status': 'active'})`,
follow these practices to avoid performance issues and excessive rebuilds:

## 1. Use Stable References for Filter Objects

💡 **Create the filter object ONCE and reuse it**

```dart
// ❌ Bad practice - creates a new map on each build
@override
Widget build(BuildContext context) {
  final users = ref.watch(filteredUsersProvider({'status': 'active'}));
  return UserList(users: users);
}

// ✅ Good practice - stable reference
final activeUsersFilter = {'status': 'active'};

@override
Widget build(BuildContext context) {
  final users = ref.watch(filteredUsersProvider(activeUsersFilter));
  return UserList(users: users);
}
```

## 2. Use Provider Families for Dynamic Filters

```dart
// Define a provider family for frequently used filter combinations
final usersByStatusProvider = filteredUsersProvider.family<String>((ref, status) {
  return {'status': status};
});

// Then use it with stable status values
@override
Widget build(BuildContext context) {
  final users = ref.watch(usersByStatusProvider('active'));
  return UserList(users: users);
}
```

## 3. Consider Local Caching for Expensive Queries

```dart
// Cache results in the provider
final cachedUsersProvider = Provider.family<Future<List<User>>, Map<String, dynamic>>((ref, filter) {
  final repository = ref.watch(usersRepositoryProvider);
  return _cachedFetch(repository, filter);
});

Map<String, List<User>> _cache = {};
String _cacheKey(Map<String, dynamic> filter) => filter.toString();

Future<List<User>> _cachedFetch(UsersRepository repository, Map<String, dynamic> filter) async {
  final key = _cacheKey(filter);
  if (_cache.containsKey(key)) {
    return _cache[key]!;
  }
  
  final results = await repository.getFiltered(filter);
  _cache[key] = results;
  return results;
}
```

## 4. Optimize Rebuild Scope

```dart
// Wrap the filtered list in a ConsumerWidget to isolate rebuilds
class FilteredUserList extends ConsumerWidget {
  final Map<String, dynamic> filter;
  
  const FilteredUserList({required this.filter, Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(filteredUsersProvider(filter));
    return UserList(users: users);
  }
}

// Parent widget doesn't rebuild when the filtered list changes
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      UserStats(),
      FilteredUserList(filter: activeUsersFilter),
      OtherWidgets(),
    ],
  );
}
```
''',
    );
  }

  /// Generate the UI rebuilding guide
  static String generateUiRebuildingGuide() {
    return generateDocumentation(
      libraryName: 'ui_rebuilding_guide',
      content: '''
// NOTE: The code samples below are for illustration purposes only and not meant to be compiled directly.
// They demonstrate patterns and best practices but may reference types not defined in this package.
# Optimizing UI Rebuilds with Repository Providers

When working with repository providers in this application, follow these
guidelines to minimize unnecessary UI rebuilds and maintain optimal performance.

## 1. Using Select for Fine-Grained Rebuilds

```dart
// ❌ Watching entire provider causes rebuilds on ANY change
@override
Widget build(BuildContext context) {
  final jobsAsync = ref.watch(jobsProvider);
  return jobsAsync.when(
    data: (jobs) => JobList(jobs: jobs),
    loading: () => CircularProgressIndicator(),
    error: (e, st) => ErrorDisplay(error: e),
  );
}

// ✅ Using select to only rebuild on specific state changes
@override
Widget build(BuildContext context) {
  final isLoading = ref.watch(jobsProvider.select((value) => value.isLoading));
  final jobs = ref.watch(jobsProvider.select((value) => value.valueOrNull ?? []));
  final error = ref.watch(jobsProvider.select((value) => value.error));
  
  if (isLoading && jobs.isEmpty) {
    return CircularProgressIndicator();
  }
  
  if (error != null && jobs.isEmpty) {
    return ErrorDisplay(error: error);
  }
  
  return JobList(jobs: jobs);
}
```

## 2. Caching Strategy for Repository Data

```dart
// In your repository provider:
// Example class (documentation only):
// @riverpod
class ExampleJobsNotifier {
  final _cache = <String, Job>{};
  
  @override
  FutureOr<List<Job>> build() async {
    // Initial load from cache if available
    if (_cache.isNotEmpty) {
      return _cache.values.toList();
    }
    
    // Otherwise load from API
    final jobs = await ref.read(jobsRepositoryProvider).getAll();
    
    // Update cache
    for (final job in jobs) {
      _cache[job.id] = job;
    }
    
    return jobs;
  }
  
  // Methods that update single items without full refresh
  Future<void> updateJob(Job job) async {
    await ref.read(jobsRepositoryProvider).update(job);
    _cache[job.id] = job;
    ref.notifyListeners(); // Notify but keep cache intact
  }
}
```

## 3. Isolating Repository Operations

```dart
// Create standalone operation providers
@riverpod
Future<void> updateJobStatus(
  UpdateJobStatusRef ref, {
  required String jobId,
  required String status,
}) async {
  final repository = ref.read(jobsRepositoryProvider);
  await repository.updateStatus(jobId, status);
  
  // Refresh only the affected job
  ref.invalidate(jobDetailProvider(jobId));
  
  // No need to refresh the entire list
}

// Using multiple providers at different levels
@override
Widget build(BuildContext context) {
  // Doesn't rebuild when individual job changes
  final allJobs = ref.watch(jobsProvider);
  
  // Only rebuilds when this specific job changes
  final selectedJob = ref.watch(
    jobDetailProvider(selectedJobId)
  );
  
  // Operation doesn't cause list rebuild
  final updateStatus = ref.watch(updateJobStatusProvider);
  
  // ...
}
```

## 4. Debouncing Frequent Updates

For data that changes rapidly (like location updates), implement debouncing:

```dart
// Example class (documentation only):
// @riverpod
class ExampleLocationUpdatesNotifier {
  Timer? _debounceTimer;
  
  @override
  Stream<LocationUpdate> build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    
    return ref.watch(locationRepositoryProvider)
      .getLocationStream()
      .debounceTime(const Duration(seconds: 1));
  }
}
```
''',
    );
  }

  /// Generate the user feedback guide
  static String generateUserFeedbackGuide() {
    return generateDocumentation(
      libraryName: 'user_feedback_guide',
      content: '''
// NOTE: The code samples below are for illustration purposes only and not meant to be compiled directly.
// They demonstrate patterns and best practices but may reference types not defined in this package.
# User Feedback Best Practices

When using repositories and providers, follow these guidelines to provide
clear and helpful feedback to users during data operations.

## 1. Handling Loading States

```dart
// In a widget that performs data operations:
@override
Widget build(BuildContext context) {
  final jobsAsync = ref.watch(jobsProvider);
  
  return Column(
    children: [
      if (jobsAsync.isLoading)
        const LinearProgressIndicator(),
        
      jobsAsync.when(
        data: (jobs) => JobsList(jobs: jobs),
        loading: () => const LoadingPlaceholder(),
        error: (e, st) => ErrorDisplay(error: e),
      ),
      
      ElevatedButton(
        onPressed: jobsAsync.isLoading
          ? null  // Disable button during loading
          : () => ref.read(jobsProvider.notifier).refresh(),
        child: const Text('Refresh'),
      ),
    ],
  );
}
```

## 2. Error Handling with User-Friendly Messages

```dart
// In your repository:
Future<List<Job>> getAll() async {
  try {
    final data = await _client.from('jobs').select();
    return data.map((json) => Job.fromJson(json)).toList();
  } catch (e, stackTrace) {
    // Convert technical errors to user-friendly ones
    throw AppException.fromError(
      e,
      userMessage: 'Could not load jobs. Please try again later.',
      stackTrace: stackTrace,
    );
  }
}

// In your UI:
@override
Widget build(BuildContext context) {
  final jobsAsync = ref.watch(jobsProvider);
  
  return jobsAsync.when(
    data: (jobs) => JobsList(jobs: jobs),
    loading: () => const LoadingPlaceholder(),
    error: (e, st) {
      final message = e is AppException
          ? e.userMessage
          : 'An unknown error occurred';
          
      return ErrorDisplay(
        message: message,
        onRetry: () => ref.refresh(jobsProvider),
      );
    },
  );
}
```

## 3. Optimistic Updates for Responsive UIs

```dart
// Example class (documentation only):
// @riverpod
class ExampleJobsNotifier {
  @override
  FutureOr<List<Job>> build() async {
    return ref.watch(jobsRepositoryProvider).getAll();
  }

  // Optimistic update pattern
  Future<void> updateJobStatus(String jobId, String status) async {
    // 1. Get current state
    final currentJobs = state.valueOrNull ?? [];
    final jobIndex = currentJobs.indexWhere((job) => job.id == jobId);
    
    if (jobIndex == -1) return;
    
    // 2. Create updated job
    final updatedJob = currentJobs[jobIndex].copyWith(status: status);
    
    // 3. Update state optimistically
    state = AsyncData([
      ...currentJobs.sublist(0, jobIndex),
      updatedJob,
      ...currentJobs.sublist(jobIndex + 1),
    ]);
    
    // 4. Perform actual update
    try {
      await ref.read(jobsRepositoryProvider).updateStatus(jobId, status);
      // Success! State is already updated.
    } catch (e) {
      // 5. Revert on failure
      state = AsyncData(currentJobs);
      
      // 6. Show error
      ref.read(snackbarProvider.notifier).show(
        'Failed to update job status: Error message',
        type: SnackbarType.error,
      );
    }
  }
}
```

## 4. Toast/Snackbar Notifications for Background Operations

```dart
// Define a snackbar provider
// Example class (documentation only):
// @riverpod
class ExampleSnackbarNotifier {
  @override
  SnackbarState build() {
    return SnackbarState(show: false);
  }
  
  void show(String message, {SnackbarType type = SnackbarType.info}) {
    state = SnackbarState(
      show: true,
      message: message,
      type: type,
    );
  }
  
  void hide() {
    state = SnackbarState(show: false);
  }
}

// In your repository providers
Future<void> submitJob(Job job) async {
  try {
    // Show "in progress" notification
    ref.read(snackbarProvider.notifier).show(
      'Submitting job...',
      type: SnackbarType.info,
    );
    
    await ref.read(jobsRepositoryProvider).create(job);
    
    // Show success notification
    ref.read(snackbarProvider.notifier).show(
      'Job submitted successfully!',
      type: SnackbarType.success,
    );
    
    // Refresh jobs list
    ref.refresh(jobsProvider);
  } catch (e) {
    // Show error notification
    ref.read(snackbarProvider.notifier).show(
      'Failed to submit job: Error message',
      type: SnackbarType.error,
    );
  }
}

// In your app scaffold
@override
Widget build(BuildContext context) {
  final snackbar = ref.watch(snackbarProvider);
  
  // Show snackbar when state changes
  useEffect(() {
    if (snackbar.show) {
      final sb = SnackBar(
        content: Text(snackbar.message),
        backgroundColor: _getColorForType(snackbar.type),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(sb);
      
      // Auto-hide after snackbar duration
      Future.delayed(Duration(seconds: 3), () {
        ref.read(snackbarProvider.notifier).hide();
      });
    }
    
    return null;
  }, [snackbar]);
  
  return Scaffold(
    // Your app content
  );
}
```
''',
    );
  }
}
