import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/trip_searches_query_builder.dart';


class TripSearchesRepository extends BaseRepository<TripSearchesModel> {
  TripSearchesRepository(SupabaseClient client) : super(client, 'trip_searches', primaryKeyColumn: 'id');
  
  @override
  TripSearchesModel fromJson(Map<String, dynamic> json) {
    return TripSearchesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(TripSearchesModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for trip_searches
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
  TripSearchesModelQueryBuilder createQueryBuilder() {
    return TripSearchesModelQueryBuilder(client);
  }
  
  /// Get a TripSearchesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TripSearchesModel?> getById(String id) async {
    final result = await client
        .from('trip_searches')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return TripSearchesModel.fromJson(result);
  }

  /// Get List<TripSearchesModel> by searcher_id
  /// 
  /// This method looks up records using the searcher_id field.
  /// It returns a list of matching records.
  Future<List<TripSearchesModel>> getBySearcherId(String searcherId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('searcher_id', searcherId);
    
    return (result as List<dynamic>)
        .map((item) => TripSearchesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<TripSearchesModel> by selected_trip_id
  /// 
  /// This method looks up records using the selected_trip_id field.
  /// It returns a list of matching records.
  Future<List<TripSearchesModel>> getBySelectedTripId(String selectedTripId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('selected_trip_id', selectedTripId);
    
    return (result as List<dynamic>)
        .map((item) => TripSearchesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(TripSearchesModel model) {
    // Validate check constraints
    // 2200_18741_11_not_null: Database CHECK constraint
    // 2200_18741_12_not_null: Database CHECK constraint
    // 2200_18741_1_not_null: Database CHECK constraint
    // trip_searches_destination_lat_check: Database CHECK constraint
    // trip_searches_destination_lng_check: Database CHECK constraint
    // trip_searches_origin_lat_check: Database CHECK constraint
    // trip_searches_origin_lng_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the searcher record associated with this trip_searches
  /// 
  /// This retrieves the parent searcher record for this trip_searches.
  /// It represents a foreign key relationship from trip_searches.searcher_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getSearcher(String searcherId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', searcherId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the searcher record exists for this trip_searches
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.searcherExists(message.userId);
  /// ```
  Future<bool> searcherExists(String searcherId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', searcherId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the selected_trip record associated with this trip_searches
  /// 
  /// This retrieves the parent selected_trip record for this trip_searches.
  /// It represents a foreign key relationship from trip_searches.selected_trip_id to trips.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<TripsModel?> getSelectedTrip(String selectedTripId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('id', selectedTripId)
        .maybeSingle();
    
    if (result == null) return null;
    return TripsModel.fromJson(result);
  }
  
  /// Check if the selected_trip record exists for this trip_searches
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.selected_tripExists(message.userId);
  /// ```
  Future<bool> selected_tripExists(String selectedTripId) async {
    final result = await client
        .from('trips')
        .select('id')
        .eq('id', selectedTripId)
        .maybeSingle();
    
    return result != null;
  }
}
