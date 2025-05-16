import '../utils/geo_json.dart';

/// Generated model class for table job_broadcasts
class JobBroadcastsModel {
  /// Primary key field
  /// Non-nullable field
  final String broadcastId;
  final String? homeownerId;
  final String? serviceId;
  /// Non-nullable field
  final String title;
  final String? description;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;
  final double? latitude;
  final double? longitude;
  final String? locationAddress;
  final DateTime? scheduledTime;
  final double? priceRangeMin;
  final double? priceRangeMax;
  final String? status;
  final String? urgencyLevel;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? expiresAt;

  JobBroadcastsModel({this.broadcastId = "", this.homeownerId, this.serviceId, required this.title, this.description, this.address, this.city, this.state, this.zipCode, this.latitude, this.longitude, this.locationAddress, this.scheduledTime, this.priceRangeMin, this.priceRangeMax, this.status, this.urgencyLevel, this.createdAt, this.updatedAt, this.expiresAt})
      : assert(() { assert(broadcastId != null, "broadcast_id constraint violation"); assert(title != null, "title constraint violation"); return true; }());

  factory JobBroadcastsModel.fromJson(Map<String, dynamic> json) {
    return JobBroadcastsModel(
      broadcastId: json['broadcast_id'] ?? '',
      homeownerId: json['homeowner_id'],
      serviceId: json['service_id'],
      title: json['title'] ?? '',
      description: json['description'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      latitude: json['latitude'] != null ? _toDouble(json['latitude']) : null,
      longitude: json['longitude'] != null ? _toDouble(json['longitude']) : null,
      locationAddress: json['location_address'],
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      priceRangeMin: json['price_range_min'] != null ? _toDouble(json['price_range_min']) : null,
      priceRangeMax: json['price_range_max'] != null ? _toDouble(json['price_range_max']) : null,
      status: json['status'],
      urgencyLevel: json['urgency_level'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'broadcast_id': broadcastId,
      'homeowner_id': homeownerId,
      'service_id': serviceId,
      'title': title,
      'description': description,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'location_address': locationAddress,
      'scheduled_time': scheduledTime?.toIso8601String(),
      'price_range_min': priceRangeMin,
      'price_range_max': priceRangeMax,
      'status': status,
      'urgency_level': urgencyLevel,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobBroadcastsModel && other.broadcastId == broadcastId && other.homeownerId == homeownerId && other.serviceId == serviceId && other.title == title && other.description == description && other.address == address && other.city == city && other.state == state && other.zipCode == zipCode && other.latitude == latitude && other.longitude == longitude && other.locationAddress == locationAddress && other.scheduledTime == scheduledTime && other.priceRangeMin == priceRangeMin && other.priceRangeMax == priceRangeMax && other.status == status && other.urgencyLevel == urgencyLevel && other.createdAt == createdAt && other.updatedAt == updatedAt && other.expiresAt == expiresAt;
  }

  @override
  int get hashCode => broadcastId.hashCode ^ homeownerId.hashCode ^ serviceId.hashCode ^ title.hashCode ^ description.hashCode ^ address.hashCode ^ city.hashCode ^ state.hashCode ^ zipCode.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ locationAddress.hashCode ^ scheduledTime.hashCode ^ priceRangeMin.hashCode ^ priceRangeMax.hashCode ^ status.hashCode ^ urgencyLevel.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ expiresAt.hashCode;

  @override
  String toString() {
    return 'JobBroadcastsModel(broadcastId: $broadcastId, homeownerId: $homeownerId, serviceId: $serviceId, title: $title, description: $description, address: $address, city: $city, state: $state, zipCode: $zipCode, latitude: $latitude, longitude: $longitude, locationAddress: $locationAddress, scheduledTime: $scheduledTime, priceRangeMin: $priceRangeMin, priceRangeMax: $priceRangeMax, status: $status, urgencyLevel: $urgencyLevel, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
  }
  /// Get the primary identifier for this record
  String get id => broadcastId;
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
