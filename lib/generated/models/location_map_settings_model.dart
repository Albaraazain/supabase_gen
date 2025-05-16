import '../utils/geo_json.dart';

/// Generated model class for table location_map_settings
class LocationMapSettingsModel {
  /// Primary key field
  /// Non-nullable field
  final String settingId;
  /// Unique field
  /// Non-nullable field
  final String jobId;
  final double? zoomLevel;
  final double? centerLatitude;
  final double? centerLongitude;
  final bool? showTerrain;
  final bool? showTraffic;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LocationMapSettingsModel({this.settingId = "", required this.jobId, this.zoomLevel, this.centerLatitude, this.centerLongitude, this.showTerrain, this.showTraffic, this.createdBy, this.createdAt, this.updatedAt})
      : assert(() { assert(settingId != null, "setting_id constraint violation"); assert(jobId != null, "job_id constraint violation"); return true; }());

  factory LocationMapSettingsModel.fromJson(Map<String, dynamic> json) {
    return LocationMapSettingsModel(
      settingId: json['setting_id'] ?? '',
      jobId: json['job_id'] ?? '',
      zoomLevel: json['zoom_level'] != null ? _toDouble(json['zoom_level']) : null,
      centerLatitude: json['center_latitude'] != null ? _toDouble(json['center_latitude']) : null,
      centerLongitude: json['center_longitude'] != null ? _toDouble(json['center_longitude']) : null,
      showTerrain: json['show_terrain'],
      showTraffic: json['show_traffic'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setting_id': settingId,
      'job_id': jobId,
      'zoom_level': zoomLevel,
      'center_latitude': centerLatitude,
      'center_longitude': centerLongitude,
      'show_terrain': showTerrain,
      'show_traffic': showTraffic,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationMapSettingsModel && other.settingId == settingId && other.jobId == jobId && other.zoomLevel == zoomLevel && other.centerLatitude == centerLatitude && other.centerLongitude == centerLongitude && other.showTerrain == showTerrain && other.showTraffic == showTraffic && other.createdBy == createdBy && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => settingId.hashCode ^ jobId.hashCode ^ zoomLevel.hashCode ^ centerLatitude.hashCode ^ centerLongitude.hashCode ^ showTerrain.hashCode ^ showTraffic.hashCode ^ createdBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'LocationMapSettingsModel(settingId: $settingId, jobId: $jobId, zoomLevel: $zoomLevel, centerLatitude: $centerLatitude, centerLongitude: $centerLongitude, showTerrain: $showTerrain, showTraffic: $showTraffic, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => settingId;
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
