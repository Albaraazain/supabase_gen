import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/verification_documents_model.dart';

/// A type-safe query builder for VerificationDocumentsModel
class VerificationDocumentsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  VerificationDocumentsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('verification_documents').select();
  }
  
  /// Set the fields to select
  VerificationDocumentsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('verification_documents').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  VerificationDocumentsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  VerificationDocumentsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  VerificationDocumentsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by user_id
  VerificationDocumentsModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by document_type
  VerificationDocumentsModelQueryBuilder whereDocumentType(String value) {
    _queryBuilder = _queryBuilder.eq('document_type', value);
    return this;
  }
  
  /// Filter by document_type with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereDocumentTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('document_type', values);
    return this;
  }
  
  

  /// Filter by document_url
  VerificationDocumentsModelQueryBuilder whereDocumentUrl(String value) {
    _queryBuilder = _queryBuilder.eq('document_url', value);
    return this;
  }
  
  /// Filter by document_url with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereDocumentUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('document_url', values);
    return this;
  }
  
  

  /// Filter by document_number
  VerificationDocumentsModelQueryBuilder whereDocumentNumber(String? value) {
    _queryBuilder = _queryBuilder.eq('document_number', value);
    return this;
  }
  
  /// Filter by document_number with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereDocumentNumberIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('document_number', values);
    return this;
  }
  
  

  /// Filter by verification_status
  VerificationDocumentsModelQueryBuilder whereVerificationStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('verification_status', value);
    return this;
  }
  
  /// Filter by verification_status with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereVerificationStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_status', values);
    return this;
  }
  
  

  /// Filter by verified_by
  VerificationDocumentsModelQueryBuilder whereVerifiedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('verified_by', value);
    return this;
  }
  
  /// Filter by verified_by with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereVerifiedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verified_by', values);
    return this;
  }
  
  

  /// Filter by verified_at
  VerificationDocumentsModelQueryBuilder whereVerifiedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('verified_at', value);
    return this;
  }
  
  /// Filter by verified_at with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereVerifiedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verified_at', values);
    return this;
  }
  
    /// Filter verified_at greater than
  VerificationDocumentsModelQueryBuilder whereVerifiedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at greater than or equal
  VerificationDocumentsModelQueryBuilder whereVerifiedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than
  VerificationDocumentsModelQueryBuilder whereVerifiedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than or equal
  VerificationDocumentsModelQueryBuilder whereVerifiedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at between two values
  VerificationDocumentsModelQueryBuilder whereVerifiedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('verified_at', min).lte('verified_at', max);
    return this;
  }

  /// Filter by rejection_reason
  VerificationDocumentsModelQueryBuilder whereRejectionReason(String? value) {
    _queryBuilder = _queryBuilder.eq('rejection_reason', value);
    return this;
  }
  
  /// Filter by rejection_reason with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereRejectionReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('rejection_reason', values);
    return this;
  }
  
  

  /// Filter by expires_at
  VerificationDocumentsModelQueryBuilder whereExpiresAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('expires_at', value);
    return this;
  }
  
  /// Filter by expires_at with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereExpiresAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('expires_at', values);
    return this;
  }
  
    /// Filter expires_at greater than
  VerificationDocumentsModelQueryBuilder whereExpiresAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at greater than or equal
  VerificationDocumentsModelQueryBuilder whereExpiresAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than
  VerificationDocumentsModelQueryBuilder whereExpiresAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than or equal
  VerificationDocumentsModelQueryBuilder whereExpiresAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at between two values
  VerificationDocumentsModelQueryBuilder whereExpiresAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('expires_at', min).lte('expires_at', max);
    return this;
  }

  /// Filter by created_at
  VerificationDocumentsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  VerificationDocumentsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  VerificationDocumentsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  VerificationDocumentsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  VerificationDocumentsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  VerificationDocumentsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  VerificationDocumentsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  VerificationDocumentsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  VerificationDocumentsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  VerificationDocumentsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  VerificationDocumentsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  VerificationDocumentsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  VerificationDocumentsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  VerificationDocumentsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  VerificationDocumentsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  VerificationDocumentsModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  VerificationDocumentsModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by document_type in ascending order
  VerificationDocumentsModelQueryBuilder orderByDocumentTypeAsc() {
    _queryBuilder = _queryBuilder.order('document_type', ascending: true);
    return this;
  }
  
  /// Order by document_type in descending order
  VerificationDocumentsModelQueryBuilder orderByDocumentTypeDesc() {
    _queryBuilder = _queryBuilder.order('document_type', ascending: false);
    return this;
  }

  /// Order by document_url in ascending order
  VerificationDocumentsModelQueryBuilder orderByDocumentUrlAsc() {
    _queryBuilder = _queryBuilder.order('document_url', ascending: true);
    return this;
  }
  
  /// Order by document_url in descending order
  VerificationDocumentsModelQueryBuilder orderByDocumentUrlDesc() {
    _queryBuilder = _queryBuilder.order('document_url', ascending: false);
    return this;
  }

  /// Order by document_number in ascending order
  VerificationDocumentsModelQueryBuilder orderByDocumentNumberAsc() {
    _queryBuilder = _queryBuilder.order('document_number', ascending: true);
    return this;
  }
  
  /// Order by document_number in descending order
  VerificationDocumentsModelQueryBuilder orderByDocumentNumberDesc() {
    _queryBuilder = _queryBuilder.order('document_number', ascending: false);
    return this;
  }

  /// Order by verification_status in ascending order
  VerificationDocumentsModelQueryBuilder orderByVerificationStatusAsc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: true);
    return this;
  }
  
  /// Order by verification_status in descending order
  VerificationDocumentsModelQueryBuilder orderByVerificationStatusDesc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: false);
    return this;
  }

  /// Order by verified_by in ascending order
  VerificationDocumentsModelQueryBuilder orderByVerifiedByAsc() {
    _queryBuilder = _queryBuilder.order('verified_by', ascending: true);
    return this;
  }
  
  /// Order by verified_by in descending order
  VerificationDocumentsModelQueryBuilder orderByVerifiedByDesc() {
    _queryBuilder = _queryBuilder.order('verified_by', ascending: false);
    return this;
  }

  /// Order by verified_at in ascending order
  VerificationDocumentsModelQueryBuilder orderByVerifiedAtAsc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: true);
    return this;
  }
  
  /// Order by verified_at in descending order
  VerificationDocumentsModelQueryBuilder orderByVerifiedAtDesc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: false);
    return this;
  }

  /// Order by rejection_reason in ascending order
  VerificationDocumentsModelQueryBuilder orderByRejectionReasonAsc() {
    _queryBuilder = _queryBuilder.order('rejection_reason', ascending: true);
    return this;
  }
  
  /// Order by rejection_reason in descending order
  VerificationDocumentsModelQueryBuilder orderByRejectionReasonDesc() {
    _queryBuilder = _queryBuilder.order('rejection_reason', ascending: false);
    return this;
  }

  /// Order by expires_at in ascending order
  VerificationDocumentsModelQueryBuilder orderByExpiresAtAsc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: true);
    return this;
  }
  
  /// Order by expires_at in descending order
  VerificationDocumentsModelQueryBuilder orderByExpiresAtDesc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  VerificationDocumentsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  VerificationDocumentsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  VerificationDocumentsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  VerificationDocumentsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of VerificationDocumentsModel
  Future<List<VerificationDocumentsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => VerificationDocumentsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<VerificationDocumentsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return VerificationDocumentsModel.fromJson(response.first as Map<String, dynamic>);
      }
      
      return null;
    } catch (e) {
      print('Error retrieving single result: $e');
      return null;
    }
  }
  
  /// Execute the query and return the count
  Future<int> count() async {
    try {
      // Use count() method directly according to Supabase Flutter 2.9.0 API
      final response = await _queryBuilder.count();
      
      // For Supabase Flutter 2.9.0+, count() returns a response with count property
      if (response.count != null) {
        return response.count ?? 0;
      }
      
      // Fallback for older versions or when count is not available
      return 0;
    } catch (e) {
      print('Error counting records: $e');
      return 0;
    }
  }
}
