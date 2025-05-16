import 'dart:convert';

/// Represents a geographic point with latitude and longitude
class Point {
  final double latitude;
  final double longitude;

  Point({required this.latitude, required this.longitude});

  /// Create a point from GeoJSON format
  factory Point.fromGeoJson(Map<String, dynamic> json) {
    if (json['type'] == 'Point' && json['coordinates'] is List) {
      final coordinates = json['coordinates'] as List;
      if (coordinates.length >= 2) {
        return Point(
          // GeoJSON uses [longitude, latitude] order
          longitude: coordinates[0] is num ? (coordinates[0] as num).toDouble() : 0.0,
          latitude: coordinates[1] is num ? (coordinates[1] as num).toDouble() : 0.0,
        );
      }
    }
    throw FormatException('Invalid GeoJSON Point format: $json');
  }

  /// Create a point from WKT (Well-Known Text) format 
  factory Point.fromWkt(String wkt) {
    final pointRegex = RegExp(r'POINT\s*\(\s*([-+]?\d*\.?\d+)\s+([-+]?\d*\.?\d+)\s*\)');
    final match = pointRegex.firstMatch(wkt);
    
    if (match != null && match.groupCount >= 2) {
      return Point(
        // WKT format is 'POINT(longitude latitude)'
        longitude: double.parse(match.group(1)!),
        latitude: double.parse(match.group(2)!),
      );
    }
    throw FormatException('Invalid WKT Point format: $wkt');
  }

  /// Parse point from various formats
  static Point? parse(dynamic value) {
    if (value == null) return null;
    
    if (value is Map<String, dynamic>) {
      // Try to parse as GeoJSON
      try {
        return Point.fromGeoJson(value);
      } catch (e) {
        // Check if it's a simple {lat, lng} map
        if (value.containsKey('latitude') && value.containsKey('longitude')) {
          return Point(
            latitude: (value['latitude'] as num).toDouble(),
            longitude: (value['longitude'] as num).toDouble(),
          );
        } else if (value.containsKey('lat') && value.containsKey('lng')) {
          return Point(
            latitude: (value['lat'] as num).toDouble(),
            longitude: (value['lng'] as num).toDouble(),
          );
        }
      }
    } else if (value is String) {
      // Try to parse as WKT
      try {
        return Point.fromWkt(value);
      } catch (e) {
        // Try to parse as GeoJSON string
        try {
          final json = jsonDecode(value);
          if (json is Map<String, dynamic>) {
            return Point.fromGeoJson(json);
          }
        } catch (_) {}
      }
    }
    
    return null;
  }

  /// Convert to GeoJSON format
  Map<String, dynamic> toGeoJson() {
    return {
      'type': 'Point',
      'coordinates': [longitude, latitude],
    };
  }

  /// Convert to a simple map
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  /// Convert to WKT format
  String toWkt() {
    return 'POINT($longitude $latitude)';
  }
  
  @override
  String toString() => 'Point($latitude, $longitude)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Point && 
        other.latitude == latitude && 
        other.longitude == longitude;
  }
  
  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

/// Helper class for handling JSON data
class JsonData {
  final dynamic _data;
  
  JsonData(this._data);
  
  /// Create JSON data from various sources
  static JsonData? parse(dynamic value) {
    if (value == null) return null;
    
    if (value is Map<String, dynamic>) {
      return JsonData(value);
    } else if (value is String) {
      try {
        final decoded = jsonDecode(value);
        return JsonData(decoded);
      } catch (_) {
        return JsonData(value);
      }
    } else if (value is List) {
      return JsonData(value);
    }
    
    return JsonData(value);
  }
  
  /// Get the raw data
  dynamic get data => _data;
  
  /// Convert to a JSON string
  String toJsonString() {
    return jsonEncode(_data);
  }
  
  @override
  String toString() {
    if (_data is Map || _data is List) {
      return toJsonString();
    }
    return _data.toString();
  }
  
  /// Convert to JSON
  dynamic toJson() => _data;
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

/// Helper function to convert geographic values to Point objects
Point? _toPoint(dynamic value) {
  return Point.parse(value);
}
