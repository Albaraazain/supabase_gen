import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/service_quotes_query_builder.dart';


class ServiceQuotesRepository extends BaseRepository<ServiceQuotesModel> {
  ServiceQuotesRepository(SupabaseClient client) : super(client, 'service_quotes');
  
  @override
  ServiceQuotesModel fromJson(Map<String, dynamic> json) {
    return ServiceQuotesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for service_quotes
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
  ServiceQuotesModelQueryBuilder createQueryBuilder() {
    return ServiceQuotesModelQueryBuilder(client);
  }
  
  /// Get a ServiceQuotesModel by quote_id
  /// 
  /// This method looks up a record using a quote_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ServiceQuotesModel?> getByQuoteId(String quoteId) async {
    final result = await client
        .from('service_quotes')
        .select().eq('quote_id', quoteId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServiceQuotesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ServiceQuotesModel model) {
    // Validate check constraints
    // 2200_17914_14_not_null: Database CHECK constraint
    // 2200_17914_15_not_null: Database CHECK constraint
    // 2200_17914_16_not_null: Database CHECK constraint
    // 2200_17914_1_not_null: Database CHECK constraint
    // 2200_17914_2_not_null: Database CHECK constraint
    // 2200_17914_3_not_null: Database CHECK constraint
    // service_quotes_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this service_quotes
  /// 
  /// This retrieves the parent job record for this service_quotes.
  /// It represents a foreign key relationship from service_quotes.job_id to jobs.id
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
  
  /// Check if the job record exists for this service_quotes
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
