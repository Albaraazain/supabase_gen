import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/work_timeline_events_query_builder.dart';


class WorkTimelineEventsRepository extends BaseRepository<WorkTimelineEventsModel> {
  WorkTimelineEventsRepository(SupabaseClient client) : super(client, 'work_timeline_events');
  
  @override
  WorkTimelineEventsModel fromJson(Map<String, dynamic> json) {
    return WorkTimelineEventsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for work_timeline_events
  /// 
  /// The query builder provides a fluent interface to build complex queries
  /// with type safety for filtering, ordering and pagination.
  /// 
  /// Example:
  /// ```dart
  /// final users = await userRepository
  ///   .createQueryBuilder()
  ///   .whereNameEquals("John")
  ///   .whereAgeGreaterThan(18)
  ///   .orderByCreatedAtDesc()
  ///   .limit(10)
  ///   .get();
  /// ```
  WorkTimelineEventsModelQueryBuilder createQueryBuilder() {
    return WorkTimelineEventsModelQueryBuilder(client);
  }
  
  /// Get a WorkTimelineEventsModel by event_id
  /// 
  /// This method looks up a record using a event_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<WorkTimelineEventsModel?> getByEventId(String eventId) async {
    final result = await client
        .from('work_timeline_events')
        .select().eq('event_id', eventId)
        .maybeSingle();
    
    if (result == null) return null;
    return WorkTimelineEventsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(WorkTimelineEventsModel model) {
    // Validate check constraints
    // 2200_18022_1_not_null: Database CHECK constraint
    // 2200_18022_2_not_null: Database CHECK constraint
    // 2200_18022_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this work_timeline_events
  /// 
  /// This retrieves the parent job record for this work_timeline_events.
  /// It represents a foreign key relationship from work_timeline_events.job_id to jobs.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<JobsModel?> getJob(String jobId) async {
    final result = await client
        .from('jobs')
        .select()
        .eq('id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobsModel.fromJson(result);
  }
  
  /// Check if the job record exists for this work_timeline_events
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.jobExists(message.userId);
  /// ```
  Future<bool> jobExists(String jobId) async {
    final result = await client
        .from('jobs')
        .select('id')
        .eq('id', jobId)
        .maybeSingle();
    
    return result != null;
  }
}
