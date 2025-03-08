import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/professional_services_repository.dart';
import '../../generated/repositories/services_repository.dart';
import '../../generated/models/professional_services_model.dart';
import '../../generated/models/services_model.dart';
import '../../services/logger_service.dart';

/// Provider for managing professional services
class ProfessionalServicesProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final ProfessionalServicesRepository _professionalServicesRepository;
  final ServicesRepository _servicesRepository;
  
  List<ProfessionalServicesModel> _myServices = [];
  List<ServicesModel> _availableServices = [];
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [ProfessionalServicesProvider]
  ProfessionalServicesProvider(this._client) 
      : _professionalServicesRepository = ProfessionalServicesRepository(_client),
        _servicesRepository = ServicesRepository(_client) {
    _logger.info('ProfessionalServicesProvider initialized', tag: 'ProfessionalServicesProvider');
  }

  /// The list of services offered by this professional
  List<ProfessionalServicesModel> get myServices => _myServices;
  
  /// The list of all available services
  List<ServicesModel> get availableServices => _availableServices;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;

  /// Loads services offered by this professional
  Future<void> loadMyServices(String professionalId) async {
    if (professionalId.isEmpty) {
      _logger.warning('Cannot load services: professionalId is empty', tag: 'ProfessionalServicesProvider');
      return;
    }
    
    _setLoading(true);

    try {
      _logger.info('Loading services for professional: $professionalId', tag: 'ProfessionalServicesProvider');
      
      final response = await _client
          .from('professional_services')
          .select('*, services(*)')
          .eq('professional_id', professionalId);
      
      _myServices = response.map((service) => ProfessionalServicesModel.fromJson(service)).toList();
      
      _logger.info('Loaded ${_myServices.length} services for professional', tag: 'ProfessionalServicesProvider');
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading professional services', e);
    }
  }

  /// Loads all available services
  Future<void> loadAvailableServices() async {
    _setLoading(true);

    try {
      _logger.info('Loading available services', tag: 'ProfessionalServicesProvider');
      
      final response = await _client
          .from('services')
          .select('*, service_categories(*)')
          .eq('is_active', true)
          .order('name');
      
      _availableServices = response.map((service) => ServicesModel.fromJson(service)).toList();
      
      _logger.info('Loaded ${_availableServices.length} available services', tag: 'ProfessionalServicesProvider');
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading available services', e);
    }
  }

  /// Adds a service to the professional's offerings
  Future<ProfessionalServicesModel?> addService(String professionalId, String serviceId, {
    double? priceRate,
    bool? isAvailable = true,
  }) async {
    if (professionalId.isEmpty || serviceId.isEmpty) {
      _logger.warning('Cannot add service: required parameters missing', tag: 'ProfessionalServicesProvider');
      return null;
    }
    
    _setLoading(true);

    try {
      _logger.info('Adding service $serviceId for professional: $professionalId', 
          tag: 'ProfessionalServicesProvider');
      
      // Check if service already exists
      final exists = _myServices.any((s) => s.serviceId == serviceId);
      if (exists) {
        _logger.warning('Service already exists for this professional', tag: 'ProfessionalServicesProvider');
        _error = 'You already offer this service';
        _isLoading = false;
        notifyListeners();
        return null;
      }
      
      final newService = ProfessionalServicesModel(
        id: 'ps_${DateTime.now().millisecondsSinceEpoch}',
        professionalId: professionalId,
        serviceId: serviceId,
        priceRate: priceRate ?? 0.0,
        isAvailable: isAvailable,
      );
      
      final createdService = await _professionalServicesRepository.insert(newService);
      
      // Add to local list
      _myServices.add(createdService);
      
      _logger.info('Service added successfully', tag: 'ProfessionalServicesProvider');
      
      _setLoading(false);
      return createdService;
    } catch (e) {
      _handleError('Error adding service', e);
      return null;
    }
  }

  /// Updates an existing professional service
  Future<ProfessionalServicesModel?> updateService(ProfessionalServicesModel service) async {
    _setLoading(true);

    try {
      _logger.info('Updating service: ${service.id}', tag: 'ProfessionalServicesProvider');
      
      final updatedService = await _professionalServicesRepository.update(service);
      
      if (updatedService != null) {
        // Update in local list
        final index = _myServices.indexWhere((s) => s.id == service.id);
        if (index != -1) {
          _myServices[index] = updatedService;
        }
        
        _logger.info('Service updated successfully', tag: 'ProfessionalServicesProvider');
        
        _setLoading(false);
        return updatedService;
      } else {
        throw Exception('Failed to update service');
      }
    } catch (e) {
      _handleError('Error updating service', e);
      return null;
    }
  }

  /// Toggles a service's availability
  Future<bool> toggleServiceAvailability(String professionalServiceId, bool isAvailable) async {
    if (professionalServiceId.isEmpty) {
      _logger.warning('Cannot toggle service: professionalServiceId is empty', 
          tag: 'ProfessionalServicesProvider');
      return false;
    }
    
    try {
      _logger.info('Toggling service availability to: $isAvailable', tag: 'ProfessionalServicesProvider');
      
      // Find the service
      final index = _myServices.indexWhere((s) => s.id == professionalServiceId);
      if (index == -1) {
        _logger.warning('Service not found: $professionalServiceId', tag: 'ProfessionalServicesProvider');
        return false;
      }
      
      final service = _myServices[index];
      final updatedService = service.copyWith(isAvailable: isAvailable);
      
      final result = await updateService(updatedService);
      return result != null;
    } catch (e) {
      _logger.error('Error toggling service availability: ${e.toString()}', 
          tag: 'ProfessionalServicesProvider', error: e);
      return false;
    }
  }

  /// Gets a service by ID
  ServicesModel? getServiceById(String serviceId) {
    return _availableServices.firstWhere(
      (service) => service.serviceId == serviceId,
      orElse: () => null as ServicesModel,
    );
  }

  /// Gets a professional service by ID
  ProfessionalServicesModel? getProfessionalServiceById(String professionalServiceId) {
    return _myServices.firstWhere(
      (service) => service.id == professionalServiceId,
      orElse: () => null as ProfessionalServicesModel,
    );
  }

  /// Clears any error message
  void clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }
  
  // Private helper methods
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _handleError(String message, dynamic error) {
    final errorMessage = error.toString();
    _error = errorMessage;
    _logger.error('$message: $errorMessage', tag: 'ProfessionalServicesProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 