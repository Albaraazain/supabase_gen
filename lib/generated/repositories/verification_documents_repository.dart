import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/verification_documents_query_builder.dart';


class VerificationDocumentsRepository extends BaseRepository<VerificationDocumentsModel> {
  VerificationDocumentsRepository(SupabaseClient client) : super(client, 'verification_documents', primaryKeyColumn: 'id');
  
  @override
  VerificationDocumentsModel fromJson(Map<String, dynamic> json) {
    return VerificationDocumentsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(VerificationDocumentsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_verification_documents_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for verification_documents
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
  VerificationDocumentsModelQueryBuilder createQueryBuilder() {
    return VerificationDocumentsModelQueryBuilder(client);
  }
  
  /// Get a VerificationDocumentsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<VerificationDocumentsModel?> getById(String id) async {
    final result = await client
        .from('verification_documents')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return VerificationDocumentsModel.fromJson(result);
  }

  /// Get List<VerificationDocumentsModel> by user_id
  /// 
  /// This method looks up records using the user_id field.
  /// It returns a list of matching records.
  Future<List<VerificationDocumentsModel>> getByUserId(String userId) async {
    final result = await client
        .from('verification_documents')
        .select()
        .eq('user_id', userId);
    
    return (result as List<dynamic>)
        .map((item) => VerificationDocumentsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<VerificationDocumentsModel> by verified_by
  /// 
  /// This method looks up records using the verified_by field.
  /// It returns a list of matching records.
  Future<List<VerificationDocumentsModel>> getByVerifiedBy(String verifiedBy) async {
    final result = await client
        .from('verification_documents')
        .select()
        .eq('verified_by', verifiedBy);
    
    return (result as List<dynamic>)
        .map((item) => VerificationDocumentsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(VerificationDocumentsModel model) {
    // Validate check constraints
    // 2200_18718_1_not_null: Database CHECK constraint
    // 2200_18718_2_not_null: Database CHECK constraint
    // 2200_18718_3_not_null: Database CHECK constraint
    // 2200_18718_4_not_null: Database CHECK constraint
    // verification_documents_document_type_check: Database CHECK constraint
    // verification_documents_verification_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this verification_documents
  /// 
  /// This retrieves the parent user record for this verification_documents.
  /// It represents a foreign key relationship from verification_documents.user_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getUser(String userId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the user record exists for this verification_documents
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.userExists(message.userId);
  /// ```
  Future<bool> userExists(String userId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the verified_by record associated with this verification_documents
  /// 
  /// This retrieves the parent verified_by record for this verification_documents.
  /// It represents a foreign key relationship from verification_documents.verified_by to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getVerifiedBy(String verifiedById) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', verifiedById)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the verified_by record exists for this verification_documents
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.verified_byExists(message.userId);
  /// ```
  Future<bool> verified_byExists(String verifiedById) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', verifiedById)
        .maybeSingle();
    
    return result != null;
  }
}
