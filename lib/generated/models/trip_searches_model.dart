import '../utils/geo_json.dart';

/// Generated model class for table trip_searches
class TripSearchesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// References profiles(id)
  final String? searcherId;
  final String? originAddress;
  final double? originLat;
  final double? originLng;
  final String? originPoint;
  final String? destinationAddress;
  final double? destinationLat;
  final double? destinationLng;
  final String? destinationPoint;
  /// Non-nullable field
  final DateTime searchDate;
  /// Non-nullable field
  final DateTime searchTime;
  final double? maxPriceWilling;
  final int? maxDetourKm;
  final int? resultsCount;
  /// References trips(id)
  final String? selectedTripId;
  final bool? madeRequest;
  final DateTime? createdAt;

  TripSearchesModel({this.id = "", this.searcherId, this.originAddress, this.originLat, this.originLng, this.originPoint, this.destinationAddress, this.destinationLat, this.destinationLng, this.destinationPoint, DateTime? searchDate, DateTime? searchTime, this.maxPriceWilling, this.maxDetourKm, this.resultsCount, this.selectedTripId, this.madeRequest, this.createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(searchDate != null, "search_date constraint violation"); assert(searchTime != null, "search_time constraint violation"); return true; }()),
        searchDate = searchDate ?? DateTime.now(),
        searchTime = searchTime ?? DateTime.now();

  factory TripSearchesModel.fromJson(Map<String, dynamic> json) {
    return TripSearchesModel(
      id: json['id'] ?? '',
      searcherId: json['searcher_id'],
      originAddress: json['origin_address'],
      originLat: json['origin_lat'] != null ? _toDouble(json['origin_lat']) : null,
      originLng: json['origin_lng'] != null ? _toDouble(json['origin_lng']) : null,
      originPoint: json['origin_point'],
      destinationAddress: json['destination_address'],
      destinationLat: json['destination_lat'] != null ? _toDouble(json['destination_lat']) : null,
      destinationLng: json['destination_lng'] != null ? _toDouble(json['destination_lng']) : null,
      destinationPoint: json['destination_point'],
      searchDate: _parseDate(json['search_date'].toString()),
      searchTime: _parseTime(json['search_time'].toString()),
      maxPriceWilling: json['max_price_willing'] != null ? _toDouble(json['max_price_willing']) : null,
      maxDetourKm: json['max_detour_km'],
      resultsCount: json['results_count'],
      selectedTripId: json['selected_trip_id'],
      madeRequest: json['made_request'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'searcher_id': searcherId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'origin_point': originPoint,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'destination_point': destinationPoint,
      'search_date': "${searchDate.year.toString().padLeft(4, '0')}-${searchDate.month.toString().padLeft(2, '0')}-${searchDate.day.toString().padLeft(2, '0')}",
      'search_time': "${searchTime.hour.toString().padLeft(2, '0')}:${searchTime.minute.toString().padLeft(2, '0')}:${searchTime.second.toString().padLeft(2, '0')}",
      'max_price_willing': maxPriceWilling,
      'max_detour_km': maxDetourKm,
      'results_count': resultsCount,
      'selected_trip_id': selectedTripId,
      'made_request': madeRequest,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'searcher_id': searcherId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'search_date': "${searchDate.year.toString().padLeft(4, '0')}-${searchDate.month.toString().padLeft(2, '0')}-${searchDate.day.toString().padLeft(2, '0')}",
      'search_time': "${searchTime.hour.toString().padLeft(2, '0')}:${searchTime.minute.toString().padLeft(2, '0')}:${searchTime.second.toString().padLeft(2, '0')}",
      'max_price_willing': maxPriceWilling,
      'max_detour_km': maxDetourKm,
      'results_count': resultsCount,
      'selected_trip_id': selectedTripId,
      'made_request': madeRequest,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'searcher_id': searcherId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'search_date': "${searchDate.year.toString().padLeft(4, '0')}-${searchDate.month.toString().padLeft(2, '0')}-${searchDate.day.toString().padLeft(2, '0')}",
      'search_time': "${searchTime.hour.toString().padLeft(2, '0')}:${searchTime.minute.toString().padLeft(2, '0')}:${searchTime.second.toString().padLeft(2, '0')}",
      'max_price_willing': maxPriceWilling,
      'max_detour_km': maxDetourKm,
      'results_count': resultsCount,
      'selected_trip_id': selectedTripId,
      'made_request': madeRequest,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripSearchesModel && other.id == id && other.searcherId == searcherId && other.originAddress == originAddress && other.originLat == originLat && other.originLng == originLng && other.originPoint == originPoint && other.destinationAddress == destinationAddress && other.destinationLat == destinationLat && other.destinationLng == destinationLng && other.destinationPoint == destinationPoint && other.searchDate == searchDate && other.searchTime == searchTime && other.maxPriceWilling == maxPriceWilling && other.maxDetourKm == maxDetourKm && other.resultsCount == resultsCount && other.selectedTripId == selectedTripId && other.madeRequest == madeRequest && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ searcherId.hashCode ^ originAddress.hashCode ^ originLat.hashCode ^ originLng.hashCode ^ originPoint.hashCode ^ destinationAddress.hashCode ^ destinationLat.hashCode ^ destinationLng.hashCode ^ destinationPoint.hashCode ^ searchDate.hashCode ^ searchTime.hashCode ^ maxPriceWilling.hashCode ^ maxDetourKm.hashCode ^ resultsCount.hashCode ^ selectedTripId.hashCode ^ madeRequest.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'TripSearchesModel(id: $id, searcherId: $searcherId, originAddress: $originAddress, originLat: $originLat, originLng: $originLng, originPoint: $originPoint, destinationAddress: $destinationAddress, destinationLat: $destinationLat, destinationLng: $destinationLng, destinationPoint: $destinationPoint, searchDate: $searchDate, searchTime: $searchTime, maxPriceWilling: $maxPriceWilling, maxDetourKm: $maxDetourKm, resultsCount: $resultsCount, selectedTripId: $selectedTripId, madeRequest: $madeRequest, createdAt: $createdAt)';
  }
  // Primary identifier is already defined as a field
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

  /// Helper function to parse DATE format (YYYY-MM-DD)
  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('-');
    return DateTime(
      int.parse(parts[0]), // year
      int.parse(parts[1]), // month
      int.parse(parts[2])  // day
    );
  }

  /// Helper function to parse TIME format (HH:MM:SS)
  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return DateTime(
      1970, 1, 1, // epoch date
      int.parse(parts[0]), // hour
      int.parse(parts[1]), // minute
      int.parse(parts[2])  // second
    );
  }
