import '../utils/geo_json.dart';

/// Generated model class for table en_route_phase
class EnRoutePhaseModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final DateTime routeStartedAt;
  final DateTime? arrivedAt;
  final DateTime? estimatedArrival;
  final double? distanceKm;
  final String? transportMode;

  EnRoutePhaseModel({required this.jobId, DateTime? routeStartedAt, this.arrivedAt, this.estimatedArrival, this.distanceKm, this.transportMode})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(routeStartedAt != null, "route_started_at constraint violation"); return true; }()),
        routeStartedAt = routeStartedAt ?? DateTime.now();

  factory EnRoutePhaseModel.fromJson(Map<String, dynamic> json) {
    return EnRoutePhaseModel(
      jobId: json['job_id'] ?? '',
      routeStartedAt: json['route_started_at'] != null ? DateTime.parse(json['route_started_at'].toString()) : DateTime.now(),
      arrivedAt: json['arrived_at'] != null ? DateTime.parse(json['arrived_at'].toString()) : null,
      estimatedArrival: json['estimated_arrival'] != null ? DateTime.parse(json['estimated_arrival'].toString()) : null,
      distanceKm: json['distance_km'] != null ? _toDouble(json['distance_km']) : null,
      transportMode: json['transport_mode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'route_started_at': routeStartedAt.toIso8601String(),
      'arrived_at': arrivedAt?.toIso8601String(),
      'estimated_arrival': estimatedArrival?.toIso8601String(),
      'distance_km': distanceKm,
      'transport_mode': transportMode,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnRoutePhaseModel && other.jobId == jobId && other.routeStartedAt == routeStartedAt && other.arrivedAt == arrivedAt && other.estimatedArrival == estimatedArrival && other.distanceKm == distanceKm && other.transportMode == transportMode;
  }

  @override
  int get hashCode => jobId.hashCode ^ routeStartedAt.hashCode ^ arrivedAt.hashCode ^ estimatedArrival.hashCode ^ distanceKm.hashCode ^ transportMode.hashCode;

  @override
  String toString() {
    return 'EnRoutePhaseModel(jobId: $jobId, routeStartedAt: $routeStartedAt, arrivedAt: $arrivedAt, estimatedArrival: $estimatedArrival, distanceKm: $distanceKm, transportMode: $transportMode)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
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
