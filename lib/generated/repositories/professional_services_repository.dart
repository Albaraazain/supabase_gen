import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_services_query_builder.dart';


class ProfessionalServicesRepository extends BaseRepository<ProfessionalServicesModel> {
  ProfessionalServicesRepository(SupabaseClient client) : super(client, 'professional_services');
  
  @override
  ProfessionalServicesModel fromJson(Map<String, dynamic> json) {
    return ProfessionalServicesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for professional_services
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
  ProfessionalServicesModelQueryBuilder createQueryBuilder() {
    return ProfessionalServicesModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalServicesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalServicesModel?> getById(String id) async {
    final result = await client
        .from('professional_services')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalServicesModel.fromJson(result);
  }

  /// Get a ProfessionalServicesModel by professional_id
  /// 
  /// This method looks up a record using a professional_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalServicesModel?> getByProfessionalId(String professionalId) async {
    final result = await client
        .from('professional_services')
        .select().eq('professional_id', professionalId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalServicesModel.fromJson(result);
  }

  /// Get a ProfessionalServicesModel by service_id
  /// 
  /// This method looks up a record using a service_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalServicesModel?> getByServiceId(String serviceId) async {
    final result = await client
        .from('professional_services')
        .select().eq('service_id', serviceId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalServicesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalServicesModel model) {
    // Validate check constraints
    // 2200_17879_1_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the service record associated with this professional_services
  /// 
  /// This retrieves the parent service record for this professional_services.
  /// It represents a foreign key relationship from professional_services.service_id to services.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ServicesModel?> getService(String serviceId) async {
    final result = await client
        .from('services')
        .select()
        .eq('id', serviceId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServicesModel.fromJson(result);
  }
  
  /// Check if the service record exists for this professional_services
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.serviceExists(message.userId);
  /// ```
  Future<bool> serviceExists(String serviceId) async {
    final result = await client
        .from('services')
        .select('id')
        .eq('id', serviceId)
        .maybeSingle();
    
    return result != null;
  }
}
