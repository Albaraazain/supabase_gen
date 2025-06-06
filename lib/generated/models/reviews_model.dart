
/// Generated model class for table reviews
/// Database triggers associated with this table:
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
///
class ReviewsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  /// References bookings(id)
  final String bookingId;
  /// Unique field
  /// Non-nullable field
  /// References profiles(id)
  final String reviewerId;
  /// Non-nullable field
  /// References profiles(id)
  final String reviewedUserId;
  /// Unique field
  /// Non-nullable field
  final String reviewerRole;
  /// Non-nullable field
  final int rating;
  final String? comment;
  final bool? isRecommended;
  final int? safetyRating;
  final int? cleanlinessRating;
  final int? punctualityRating;
  final int? communicationRating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ReviewsModel({this.id = "", required this.bookingId, required this.reviewerId, required this.reviewedUserId, required this.reviewerRole, required this.rating, this.comment, this.isRecommended, this.safetyRating, this.cleanlinessRating, this.punctualityRating, this.communicationRating, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(bookingId != null, "booking_id constraint violation"); assert(reviewerId != null, "reviewer_id constraint violation"); assert(reviewedUserId != null, "reviewed_user_id constraint violation"); assert(reviewerRole != null, "reviewer_role constraint violation"); assert(rating != null, "rating constraint violation"); return true; }());

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json['id'] ?? '',
      bookingId: json['booking_id'] ?? '',
      reviewerId: json['reviewer_id'] ?? '',
      reviewedUserId: json['reviewed_user_id'] ?? '',
      reviewerRole: json['reviewer_role'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'],
      isRecommended: json['is_recommended'],
      safetyRating: json['safety_rating'],
      cleanlinessRating: json['cleanliness_rating'],
      punctualityRating: json['punctuality_rating'],
      communicationRating: json['communication_rating'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'booking_id': bookingId,
      'reviewer_id': reviewerId,
      'reviewed_user_id': reviewedUserId,
      'reviewer_role': reviewerRole,
      'rating': rating,
      'comment': comment,
      'is_recommended': isRecommended,
      'safety_rating': safetyRating,
      'cleanliness_rating': cleanlinessRating,
      'punctuality_rating': punctualityRating,
      'communication_rating': communicationRating,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'booking_id': bookingId,
      'reviewer_id': reviewerId,
      'reviewed_user_id': reviewedUserId,
      'reviewer_role': reviewerRole,
      'rating': rating,
      'comment': comment,
      'is_recommended': isRecommended,
      'safety_rating': safetyRating,
      'cleanliness_rating': cleanlinessRating,
      'punctuality_rating': punctualityRating,
      'communication_rating': communicationRating,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'booking_id': bookingId,
      'reviewer_id': reviewerId,
      'reviewed_user_id': reviewedUserId,
      'reviewer_role': reviewerRole,
      'rating': rating,
      'comment': comment,
      'is_recommended': isRecommended,
      'safety_rating': safetyRating,
      'cleanliness_rating': cleanlinessRating,
      'punctuality_rating': punctualityRating,
      'communication_rating': communicationRating,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewsModel && other.id == id && other.bookingId == bookingId && other.reviewerId == reviewerId && other.reviewedUserId == reviewedUserId && other.reviewerRole == reviewerRole && other.rating == rating && other.comment == comment && other.isRecommended == isRecommended && other.safetyRating == safetyRating && other.cleanlinessRating == cleanlinessRating && other.punctualityRating == punctualityRating && other.communicationRating == communicationRating && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ bookingId.hashCode ^ reviewerId.hashCode ^ reviewedUserId.hashCode ^ reviewerRole.hashCode ^ rating.hashCode ^ comment.hashCode ^ isRecommended.hashCode ^ safetyRating.hashCode ^ cleanlinessRating.hashCode ^ punctualityRating.hashCode ^ communicationRating.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ReviewsModel(id: $id, bookingId: $bookingId, reviewerId: $reviewerId, reviewedUserId: $reviewedUserId, reviewerRole: $reviewerRole, rating: $rating, comment: $comment, isRecommended: $isRecommended, safetyRating: $safetyRating, cleanlinessRating: $cleanlinessRating, punctualityRating: $punctualityRating, communicationRating: $communicationRating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  // Primary identifier is already defined as a field
}


