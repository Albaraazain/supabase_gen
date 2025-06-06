import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/reviews_model.dart';

/// A type-safe query builder for ReviewsModel
class ReviewsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ReviewsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('reviews').select();
  }
  
  /// Set the fields to select
  ReviewsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('reviews').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ReviewsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ReviewsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ReviewsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ReviewsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by booking_id
  ReviewsModelQueryBuilder whereBookingId(String value) {
    _queryBuilder = _queryBuilder.eq('booking_id', value);
    return this;
  }
  
  /// Filter by booking_id with multiple values (IN operator)
  ReviewsModelQueryBuilder whereBookingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('booking_id', values);
    return this;
  }
  
  

  /// Filter by reviewer_id
  ReviewsModelQueryBuilder whereReviewerId(String value) {
    _queryBuilder = _queryBuilder.eq('reviewer_id', value);
    return this;
  }
  
  /// Filter by reviewer_id with multiple values (IN operator)
  ReviewsModelQueryBuilder whereReviewerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reviewer_id', values);
    return this;
  }
  
  

  /// Filter by reviewed_user_id
  ReviewsModelQueryBuilder whereReviewedUserId(String value) {
    _queryBuilder = _queryBuilder.eq('reviewed_user_id', value);
    return this;
  }
  
  /// Filter by reviewed_user_id with multiple values (IN operator)
  ReviewsModelQueryBuilder whereReviewedUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reviewed_user_id', values);
    return this;
  }
  
  

  /// Filter by reviewer_role
  ReviewsModelQueryBuilder whereReviewerRole(String value) {
    _queryBuilder = _queryBuilder.eq('reviewer_role', value);
    return this;
  }
  
  /// Filter by reviewer_role with multiple values (IN operator)
  ReviewsModelQueryBuilder whereReviewerRoleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reviewer_role', values);
    return this;
  }
  
  

  /// Filter by rating
  ReviewsModelQueryBuilder whereRating(int value) {
    _queryBuilder = _queryBuilder.eq('rating', value);
    return this;
  }
  
  /// Filter by rating with multiple values (IN operator)
  ReviewsModelQueryBuilder whereRatingIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('rating', values);
    return this;
  }
  
    /// Filter rating greater than
  ReviewsModelQueryBuilder whereRatingGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('rating', value);
    return this;
  }
  
  /// Filter rating greater than or equal
  ReviewsModelQueryBuilder whereRatingGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('rating', value);
    return this;
  }
  
  /// Filter rating less than
  ReviewsModelQueryBuilder whereRatingLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('rating', value);
    return this;
  }
  
  /// Filter rating less than or equal
  ReviewsModelQueryBuilder whereRatingLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('rating', value);
    return this;
  }
  
  /// Filter rating between two values
  ReviewsModelQueryBuilder whereRatingBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('rating', min).lte('rating', max);
    return this;
  }

  /// Filter by comment
  ReviewsModelQueryBuilder whereComment(String? value) {
    _queryBuilder = _queryBuilder.eq('comment', value);
    return this;
  }
  
  /// Filter by comment with multiple values (IN operator)
  ReviewsModelQueryBuilder whereCommentIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('comment', values);
    return this;
  }
  
  

  /// Filter by is_recommended
  ReviewsModelQueryBuilder whereIsRecommended(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_recommended', value);
    return this;
  }
  
  /// Filter by is_recommended with multiple values (IN operator)
  ReviewsModelQueryBuilder whereIsRecommendedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_recommended', values);
    return this;
  }
  
  

  /// Filter by safety_rating
  ReviewsModelQueryBuilder whereSafetyRating(int? value) {
    _queryBuilder = _queryBuilder.eq('safety_rating', value);
    return this;
  }
  
  /// Filter by safety_rating with multiple values (IN operator)
  ReviewsModelQueryBuilder whereSafetyRatingIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('safety_rating', values);
    return this;
  }
  
    /// Filter safety_rating greater than
  ReviewsModelQueryBuilder whereSafetyRatingGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('safety_rating', value);
    return this;
  }
  
  /// Filter safety_rating greater than or equal
  ReviewsModelQueryBuilder whereSafetyRatingGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('safety_rating', value);
    return this;
  }
  
  /// Filter safety_rating less than
  ReviewsModelQueryBuilder whereSafetyRatingLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('safety_rating', value);
    return this;
  }
  
  /// Filter safety_rating less than or equal
  ReviewsModelQueryBuilder whereSafetyRatingLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('safety_rating', value);
    return this;
  }
  
  /// Filter safety_rating between two values
  ReviewsModelQueryBuilder whereSafetyRatingBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('safety_rating', min).lte('safety_rating', max);
    return this;
  }

  /// Filter by cleanliness_rating
  ReviewsModelQueryBuilder whereCleanlinessRating(int? value) {
    _queryBuilder = _queryBuilder.eq('cleanliness_rating', value);
    return this;
  }
  
  /// Filter by cleanliness_rating with multiple values (IN operator)
  ReviewsModelQueryBuilder whereCleanlinessRatingIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cleanliness_rating', values);
    return this;
  }
  
    /// Filter cleanliness_rating greater than
  ReviewsModelQueryBuilder whereCleanlinessRatingGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('cleanliness_rating', value);
    return this;
  }
  
  /// Filter cleanliness_rating greater than or equal
  ReviewsModelQueryBuilder whereCleanlinessRatingGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('cleanliness_rating', value);
    return this;
  }
  
  /// Filter cleanliness_rating less than
  ReviewsModelQueryBuilder whereCleanlinessRatingLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('cleanliness_rating', value);
    return this;
  }
  
  /// Filter cleanliness_rating less than or equal
  ReviewsModelQueryBuilder whereCleanlinessRatingLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('cleanliness_rating', value);
    return this;
  }
  
  /// Filter cleanliness_rating between two values
  ReviewsModelQueryBuilder whereCleanlinessRatingBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('cleanliness_rating', min).lte('cleanliness_rating', max);
    return this;
  }

  /// Filter by punctuality_rating
  ReviewsModelQueryBuilder wherePunctualityRating(int? value) {
    _queryBuilder = _queryBuilder.eq('punctuality_rating', value);
    return this;
  }
  
  /// Filter by punctuality_rating with multiple values (IN operator)
  ReviewsModelQueryBuilder wherePunctualityRatingIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('punctuality_rating', values);
    return this;
  }
  
    /// Filter punctuality_rating greater than
  ReviewsModelQueryBuilder wherePunctualityRatingGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('punctuality_rating', value);
    return this;
  }
  
  /// Filter punctuality_rating greater than or equal
  ReviewsModelQueryBuilder wherePunctualityRatingGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('punctuality_rating', value);
    return this;
  }
  
  /// Filter punctuality_rating less than
  ReviewsModelQueryBuilder wherePunctualityRatingLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('punctuality_rating', value);
    return this;
  }
  
  /// Filter punctuality_rating less than or equal
  ReviewsModelQueryBuilder wherePunctualityRatingLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('punctuality_rating', value);
    return this;
  }
  
  /// Filter punctuality_rating between two values
  ReviewsModelQueryBuilder wherePunctualityRatingBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('punctuality_rating', min).lte('punctuality_rating', max);
    return this;
  }

  /// Filter by communication_rating
  ReviewsModelQueryBuilder whereCommunicationRating(int? value) {
    _queryBuilder = _queryBuilder.eq('communication_rating', value);
    return this;
  }
  
  /// Filter by communication_rating with multiple values (IN operator)
  ReviewsModelQueryBuilder whereCommunicationRatingIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('communication_rating', values);
    return this;
  }
  
    /// Filter communication_rating greater than
  ReviewsModelQueryBuilder whereCommunicationRatingGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('communication_rating', value);
    return this;
  }
  
  /// Filter communication_rating greater than or equal
  ReviewsModelQueryBuilder whereCommunicationRatingGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('communication_rating', value);
    return this;
  }
  
  /// Filter communication_rating less than
  ReviewsModelQueryBuilder whereCommunicationRatingLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('communication_rating', value);
    return this;
  }
  
  /// Filter communication_rating less than or equal
  ReviewsModelQueryBuilder whereCommunicationRatingLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('communication_rating', value);
    return this;
  }
  
  /// Filter communication_rating between two values
  ReviewsModelQueryBuilder whereCommunicationRatingBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('communication_rating', min).lte('communication_rating', max);
    return this;
  }

  /// Filter by created_at
  ReviewsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ReviewsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ReviewsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ReviewsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ReviewsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ReviewsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ReviewsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ReviewsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ReviewsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ReviewsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ReviewsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ReviewsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ReviewsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ReviewsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  ReviewsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ReviewsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by booking_id in ascending order
  ReviewsModelQueryBuilder orderByBookingIdAsc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: true);
    return this;
  }
  
  /// Order by booking_id in descending order
  ReviewsModelQueryBuilder orderByBookingIdDesc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: false);
    return this;
  }

  /// Order by reviewer_id in ascending order
  ReviewsModelQueryBuilder orderByReviewerIdAsc() {
    _queryBuilder = _queryBuilder.order('reviewer_id', ascending: true);
    return this;
  }
  
  /// Order by reviewer_id in descending order
  ReviewsModelQueryBuilder orderByReviewerIdDesc() {
    _queryBuilder = _queryBuilder.order('reviewer_id', ascending: false);
    return this;
  }

  /// Order by reviewed_user_id in ascending order
  ReviewsModelQueryBuilder orderByReviewedUserIdAsc() {
    _queryBuilder = _queryBuilder.order('reviewed_user_id', ascending: true);
    return this;
  }
  
  /// Order by reviewed_user_id in descending order
  ReviewsModelQueryBuilder orderByReviewedUserIdDesc() {
    _queryBuilder = _queryBuilder.order('reviewed_user_id', ascending: false);
    return this;
  }

  /// Order by reviewer_role in ascending order
  ReviewsModelQueryBuilder orderByReviewerRoleAsc() {
    _queryBuilder = _queryBuilder.order('reviewer_role', ascending: true);
    return this;
  }
  
  /// Order by reviewer_role in descending order
  ReviewsModelQueryBuilder orderByReviewerRoleDesc() {
    _queryBuilder = _queryBuilder.order('reviewer_role', ascending: false);
    return this;
  }

  /// Order by rating in ascending order
  ReviewsModelQueryBuilder orderByRatingAsc() {
    _queryBuilder = _queryBuilder.order('rating', ascending: true);
    return this;
  }
  
  /// Order by rating in descending order
  ReviewsModelQueryBuilder orderByRatingDesc() {
    _queryBuilder = _queryBuilder.order('rating', ascending: false);
    return this;
  }

  /// Order by comment in ascending order
  ReviewsModelQueryBuilder orderByCommentAsc() {
    _queryBuilder = _queryBuilder.order('comment', ascending: true);
    return this;
  }
  
  /// Order by comment in descending order
  ReviewsModelQueryBuilder orderByCommentDesc() {
    _queryBuilder = _queryBuilder.order('comment', ascending: false);
    return this;
  }

  /// Order by is_recommended in ascending order
  ReviewsModelQueryBuilder orderByIsRecommendedAsc() {
    _queryBuilder = _queryBuilder.order('is_recommended', ascending: true);
    return this;
  }
  
  /// Order by is_recommended in descending order
  ReviewsModelQueryBuilder orderByIsRecommendedDesc() {
    _queryBuilder = _queryBuilder.order('is_recommended', ascending: false);
    return this;
  }

  /// Order by safety_rating in ascending order
  ReviewsModelQueryBuilder orderBySafetyRatingAsc() {
    _queryBuilder = _queryBuilder.order('safety_rating', ascending: true);
    return this;
  }
  
  /// Order by safety_rating in descending order
  ReviewsModelQueryBuilder orderBySafetyRatingDesc() {
    _queryBuilder = _queryBuilder.order('safety_rating', ascending: false);
    return this;
  }

  /// Order by cleanliness_rating in ascending order
  ReviewsModelQueryBuilder orderByCleanlinessRatingAsc() {
    _queryBuilder = _queryBuilder.order('cleanliness_rating', ascending: true);
    return this;
  }
  
  /// Order by cleanliness_rating in descending order
  ReviewsModelQueryBuilder orderByCleanlinessRatingDesc() {
    _queryBuilder = _queryBuilder.order('cleanliness_rating', ascending: false);
    return this;
  }

  /// Order by punctuality_rating in ascending order
  ReviewsModelQueryBuilder orderByPunctualityRatingAsc() {
    _queryBuilder = _queryBuilder.order('punctuality_rating', ascending: true);
    return this;
  }
  
  /// Order by punctuality_rating in descending order
  ReviewsModelQueryBuilder orderByPunctualityRatingDesc() {
    _queryBuilder = _queryBuilder.order('punctuality_rating', ascending: false);
    return this;
  }

  /// Order by communication_rating in ascending order
  ReviewsModelQueryBuilder orderByCommunicationRatingAsc() {
    _queryBuilder = _queryBuilder.order('communication_rating', ascending: true);
    return this;
  }
  
  /// Order by communication_rating in descending order
  ReviewsModelQueryBuilder orderByCommunicationRatingDesc() {
    _queryBuilder = _queryBuilder.order('communication_rating', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ReviewsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ReviewsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ReviewsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ReviewsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ReviewsModel
  Future<List<ReviewsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ReviewsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ReviewsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ReviewsModel.fromJson(response.first as Map<String, dynamic>);
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
