import '../utils/geo_json.dart';

/// Generated model class for table location_bookmarks
class LocationBookmarksModel {
  /// Primary key field
  /// Non-nullable field
  final String bookmarkId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String name;
  final String? description;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LocationBookmarksModel({this.bookmarkId = "", required this.jobId, required this.name, this.description, required this.latitude, required this.longitude, this.createdBy, this.createdAt, this.updatedAt})
      : assert(() { assert(bookmarkId != null, "bookmark_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(name != null, "name constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); return true; }());

  factory LocationBookmarksModel.fromJson(Map<String, dynamic> json) {
    return LocationBookmarksModel(
      bookmarkId: json['bookmark_id'] ?? '',
      jobId: json['job_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookmark_id': bookmarkId,
      'job_id': jobId,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationBookmarksModel && other.bookmarkId == bookmarkId && other.jobId == jobId && other.name == name && other.description == description && other.latitude == latitude && other.longitude == longitude && other.createdBy == createdBy && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => bookmarkId.hashCode ^ jobId.hashCode ^ name.hashCode ^ description.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ createdBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'LocationBookmarksModel(bookmarkId: $bookmarkId, jobId: $jobId, name: $name, description: $description, latitude: $latitude, longitude: $longitude, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => bookmarkId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
