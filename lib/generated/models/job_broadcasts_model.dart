
class JobBroadcastsModel {
  final String broadcastId;
  final String homeownerId;
  final String serviceId;
  final String? status;
  final String title;
  final String? description;
  final String? locationAddress;
  final double? locationLat;
  final double? locationLng;
  final String? urgencyLevel;
  final DateTime? preferredSchedule;
  final double? budgetRangeMin;
  final double? budgetRangeMax;
  final int? broadcastRadius;
  final DateTime? createdAt;
  final DateTime? expiryTime;

  JobBroadcastsModel({
    required this.broadcastId,
    required this.homeownerId,
    required this.serviceId,
    this.status,
    required this.title,
    this.description,
    this.locationAddress,
    this.locationLat,
    this.locationLng,
    this.urgencyLevel,
    this.preferredSchedule,
    this.budgetRangeMin,
    this.budgetRangeMax,
    this.broadcastRadius,
    this.createdAt,
    this.expiryTime,
  });

  factory JobBroadcastsModel.fromJson(Map<String, dynamic> json) {
    return JobBroadcastsModel(
      broadcastId: json['broadcast_id'] ?? '',
      homeownerId: json['homeowner_id'] ?? '',
      serviceId: json['service_id'] ?? '',
      status: json['status'],
      title: json['title'] ?? '',
      description: json['description'],
      locationAddress: json['location_address'],
      locationLat: json['location_lat'],
      locationLng: json['location_lng'],
      urgencyLevel: json['urgency_level'],
      preferredSchedule: json['preferred_schedule'] != null ? DateTime.parse(json['preferred_schedule'].toString()) : null,
      budgetRangeMin: json['budget_range_min'],
      budgetRangeMax: json['budget_range_max'],
      broadcastRadius: json['broadcast_radius'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      expiryTime: json['expiry_time'] != null ? DateTime.parse(json['expiry_time'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'broadcast_id': broadcastId,
      'homeowner_id': homeownerId,
      'service_id': serviceId,
      'status': status,
      'title': title,
      'description': description,
      'location_address': locationAddress,
      'location_lat': locationLat,
      'location_lng': locationLng,
      'urgency_level': urgencyLevel,
      'preferred_schedule': preferredSchedule?.toIso8601String(),
      'budget_range_min': budgetRangeMin,
      'budget_range_max': budgetRangeMax,
      'broadcast_radius': broadcastRadius,
      'created_at': createdAt?.toIso8601String(),
      'expiry_time': expiryTime?.toIso8601String(),
    };
  }

  JobBroadcastsModel copyWith({
    String? broadcastId,
    String? homeownerId,
    String? serviceId,
    String? status,
    String? title,
    String? description,
    String? locationAddress,
    double? locationLat,
    double? locationLng,
    String? urgencyLevel,
    DateTime? preferredSchedule,
    double? budgetRangeMin,
    double? budgetRangeMax,
    int? broadcastRadius,
    DateTime? createdAt,
    DateTime? expiryTime,
  }) {
    return JobBroadcastsModel(
      broadcastId: broadcastId ?? this.broadcastId,
      homeownerId: homeownerId ?? this.homeownerId,
      serviceId: serviceId ?? this.serviceId,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      locationAddress: locationAddress ?? this.locationAddress,
      locationLat: locationLat ?? this.locationLat,
      locationLng: locationLng ?? this.locationLng,
      urgencyLevel: urgencyLevel ?? this.urgencyLevel,
      preferredSchedule: preferredSchedule ?? this.preferredSchedule,
      budgetRangeMin: budgetRangeMin ?? this.budgetRangeMin,
      budgetRangeMax: budgetRangeMax ?? this.budgetRangeMax,
      broadcastRadius: broadcastRadius ?? this.broadcastRadius,
      createdAt: createdAt ?? this.createdAt,
      expiryTime: expiryTime ?? this.expiryTime,
    );
  }
}
