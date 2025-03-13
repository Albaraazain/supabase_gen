
class JobBroadcastsModel {
  final String? address;
  final String? broadcastId;
  final String? city;
  final DateTime? createdAt;
  final String? description;
  final DateTime? expiresAt;
  final String? homeownerId;
  final double? latitude;
  final String? locationAddress;
  final double? longitude;
  final double? priceRangeMax;
  final double? priceRangeMin;
  final DateTime? scheduledTime;
  final String? serviceId;
  final String? state;
  final String? status;
  final String title;
  final DateTime? updatedAt;
  final String? urgencyLevel;
  final String? zipCode;

  JobBroadcastsModel({
    this.address,
    this.broadcastId,
    this.city,
    this.createdAt,
    this.description,
    this.expiresAt,
    this.homeownerId,
    this.latitude,
    this.locationAddress,
    this.longitude,
    this.priceRangeMax,
    this.priceRangeMin,
    this.scheduledTime,
    this.serviceId,
    this.state,
    this.status,
    required this.title,
    this.updatedAt,
    this.urgencyLevel,
    this.zipCode,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory JobBroadcastsModel.fromJson(Map<String, dynamic> json) {
    return JobBroadcastsModel(
      address: json['address'],
      broadcastId: json['broadcast_id'],
      city: json['city'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'],
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'].toString()) : null,
      homeownerId: json['homeowner_id'],
      latitude: json['latitude'] != null ? _toDouble(json['latitude']) : null,
      locationAddress: json['location_address'],
      longitude: json['longitude'] != null ? _toDouble(json['longitude']) : null,
      priceRangeMax: json['price_range_max'] != null ? _toDouble(json['price_range_max']) : null,
      priceRangeMin: json['price_range_min'] != null ? _toDouble(json['price_range_min']) : null,
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      serviceId: json['service_id'],
      state: json['state'],
      status: json['status'],
      title: json['title'] ?? '',
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      urgencyLevel: json['urgency_level'],
      zipCode: json['zip_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (address != null) {
      json['address'] = address;
    }
    if (broadcastId != null) {
      json['broadcast_id'] = broadcastId;
    }
    if (city != null) {
      json['city'] = city;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (description != null) {
      json['description'] = description;
    }
    if (expiresAt != null) {
      json['expires_at'] = expiresAt!.toIso8601String();
    }
    if (homeownerId != null) {
      json['homeowner_id'] = homeownerId;
    }
    if (latitude != null) {
      json['latitude'] = latitude;
    }
    if (locationAddress != null) {
      json['location_address'] = locationAddress;
    }
    if (longitude != null) {
      json['longitude'] = longitude;
    }
    if (priceRangeMax != null) {
      json['price_range_max'] = priceRangeMax;
    }
    if (priceRangeMin != null) {
      json['price_range_min'] = priceRangeMin;
    }
    if (scheduledTime != null) {
      json['scheduled_time'] = scheduledTime!.toIso8601String();
    }
    if (serviceId != null) {
      json['service_id'] = serviceId;
    }
    if (state != null) {
      json['state'] = state;
    }
    if (status != null) {
      json['status'] = status;
    }
    json['title'] = title;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (urgencyLevel != null) {
      json['urgency_level'] = urgencyLevel;
    }
    if (zipCode != null) {
      json['zip_code'] = zipCode;
    }
    return json;
  }

  JobBroadcastsModel copyWith({
    String? address,
    String? broadcastId,
    String? city,
    DateTime? createdAt,
    String? description,
    DateTime? expiresAt,
    String? homeownerId,
    double? latitude,
    String? locationAddress,
    double? longitude,
    double? priceRangeMax,
    double? priceRangeMin,
    DateTime? scheduledTime,
    String? serviceId,
    String? state,
    String? status,
    String? title,
    DateTime? updatedAt,
    String? urgencyLevel,
    String? zipCode,
  }) {
    return JobBroadcastsModel(
      address: address ?? this.address,
      broadcastId: broadcastId ?? this.broadcastId,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      expiresAt: expiresAt ?? this.expiresAt,
      homeownerId: homeownerId ?? this.homeownerId,
      latitude: latitude ?? this.latitude,
      locationAddress: locationAddress ?? this.locationAddress,
      longitude: longitude ?? this.longitude,
      priceRangeMax: priceRangeMax ?? this.priceRangeMax,
      priceRangeMin: priceRangeMin ?? this.priceRangeMin,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      serviceId: serviceId ?? this.serviceId,
      state: state ?? this.state,
      status: status ?? this.status,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
      urgencyLevel: urgencyLevel ?? this.urgencyLevel,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
