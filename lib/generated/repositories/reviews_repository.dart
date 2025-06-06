import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/reviews_query_builder.dart';


class ReviewsRepository extends BaseRepository<ReviewsModel> {
  ReviewsRepository(SupabaseClient client) : super(client, 'reviews', primaryKeyColumn: 'id');
  
  @override
  ReviewsModel fromJson(Map<String, dynamic> json) {
    return ReviewsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ReviewsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_reviews_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  /// - update_user_ratings_trigger: INSERT AFTER - EXECUTE FUNCTION update_user_ratings()
  ///   Signature: update_user_ratings() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   -- Update driver ratings   IF NEW.reviewer_role = 'passenger' THEN     UPDATE profiles      SET driver_ratin...
  /// - update_user_ratings_trigger: UPDATE AFTER - EXECUTE FUNCTION update_user_ratings()
  ///   Signature: update_user_ratings() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   -- Update driver ratings   IF NEW.reviewer_role = 'passenger' THEN     UPDATE profiles      SET driver_ratin...
  
  /// Create a type-safe query builder for reviews
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
  ReviewsModelQueryBuilder createQueryBuilder() {
    return ReviewsModelQueryBuilder(client);
  }
  
  /// Get a ReviewsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ReviewsModel?> getById(String id) async {
    final result = await client
        .from('reviews')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ReviewsModel.fromJson(result);
  }

  /// Get a ReviewsModel by booking_id
  /// 
  /// This method looks up a record using a booking_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ReviewsModel?> getByBookingId(String bookingId) async {
    final result = await client
        .from('reviews')
        .select().eq('booking_id', bookingId)
        .maybeSingle();
    
    if (result == null) return null;
    return ReviewsModel.fromJson(result);
  }

  /// Get a ReviewsModel by reviewer_id
  /// 
  /// This method looks up a record using a reviewer_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ReviewsModel?> getByReviewerId(String reviewerId) async {
    final result = await client
        .from('reviews')
        .select().eq('reviewer_id', reviewerId)
        .maybeSingle();
    
    if (result == null) return null;
    return ReviewsModel.fromJson(result);
  }

  /// Get a ReviewsModel by reviewer_role
  /// 
  /// This method looks up a record using a reviewer_role field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ReviewsModel?> getByReviewerRole(String reviewerRole) async {
    final result = await client
        .from('reviews')
        .select().eq('reviewer_role', reviewerRole)
        .maybeSingle();
    
    if (result == null) return null;
    return ReviewsModel.fromJson(result);
  }

  /// Get List<ReviewsModel> by reviewed_user_id
  /// 
  /// This method looks up records using the reviewed_user_id field.
  /// It returns a list of matching records.
  Future<List<ReviewsModel>> getByReviewedUserId(String reviewedUserId) async {
    final result = await client
        .from('reviews')
        .select()
        .eq('reviewed_user_id', reviewedUserId);
    
    return (result as List<dynamic>)
        .map((item) => ReviewsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ReviewsModel model) {
    // Validate check constraints
    // 2200_18536_1_not_null: Database CHECK constraint
    // 2200_18536_2_not_null: Database CHECK constraint
    // 2200_18536_3_not_null: Database CHECK constraint
    // 2200_18536_4_not_null: Database CHECK constraint
    // 2200_18536_5_not_null: Database CHECK constraint
    // 2200_18536_6_not_null: Database CHECK constraint
    // reviews_cleanliness_rating_check: Database CHECK constraint
    // reviews_communication_rating_check: Database CHECK constraint
    // reviews_punctuality_rating_check: Database CHECK constraint
    // reviews_rating_check: Database CHECK constraint
    // reviews_reviewer_role_check: Database CHECK constraint
    // reviews_safety_rating_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the booking record associated with this reviews
  /// 
  /// This retrieves the parent booking record for this reviews.
  /// It represents a foreign key relationship from reviews.booking_id to bookings.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<BookingsModel?> getBooking(String bookingId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('id', bookingId)
        .maybeSingle();
    
    if (result == null) return null;
    return BookingsModel.fromJson(result);
  }
  
  /// Check if the booking record exists for this reviews
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.bookingExists(message.userId);
  /// ```
  Future<bool> bookingExists(String bookingId) async {
    final result = await client
        .from('bookings')
        .select('id')
        .eq('id', bookingId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the reviewer record associated with this reviews
  /// 
  /// This retrieves the parent reviewer record for this reviews.
  /// It represents a foreign key relationship from reviews.reviewer_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getReviewer(String reviewerId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', reviewerId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the reviewer record exists for this reviews
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.reviewerExists(message.userId);
  /// ```
  Future<bool> reviewerExists(String reviewerId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', reviewerId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the reviewed_user record associated with this reviews
  /// 
  /// This retrieves the parent reviewed_user record for this reviews.
  /// It represents a foreign key relationship from reviews.reviewed_user_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getReviewedUser(String reviewedUserId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', reviewedUserId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the reviewed_user record exists for this reviews
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.reviewed_userExists(message.userId);
  /// ```
  Future<bool> reviewed_userExists(String reviewedUserId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', reviewedUserId)
        .maybeSingle();
    
    return result != null;
  }
}
