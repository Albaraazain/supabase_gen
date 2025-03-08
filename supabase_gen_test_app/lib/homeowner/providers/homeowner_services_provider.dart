import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/services_repository.dart';
import '../../generated/models/services_model.dart';
import '../../services/logger_service.dart';

/// Provider for managing services available to homeowners
class HomeownerServicesProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final ServicesRepository _repository;
  
  List<ServicesModel> _availableServices = [];
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [HomeownerServicesProvider]
  HomeownerServicesProvider(this._client) 
      : _repository = ServicesRepository(_client) {
    _logger.info('HomeownerServicesProvider initialized', tag: 'HomeownerServicesProvider');
  }

  /// The list of available services
  List<ServicesModel> get availableServices => _availableServices;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;

  /// Loads all available services
  Future<void> loadAvailableServices() async {
    _setLoading(true);

    try {
      _logger.info('Loading available services', tag: 'HomeownerServicesProvider');
      
      final response = await _client
          .from('services')
          .select('*, service_categories(*)')
          .eq('is_active', true)
          .order('name');
      
      _availableServices = response.map((service) => ServicesModel.fromJson(service)).toList();
      
      _logger.info('Loaded ${_availableServices.length} available services', tag: 'HomeownerServicesProvider');
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading available services', e);
    }
  }

  /// Searches for services by name
  Future<List<ServicesModel>> searchServices(String query) async {
    if (query.isEmpty) {
      return _availableServices;
    }
    
    try {
      _logger.info('Searching services with query: $query', tag: 'HomeownerServicesProvider');
      
      final response = await _client
          .from('services')
          .select('*, service_categories(*)')
          .eq('is_active', true)
          .ilike('name', '%$query%')
          .order('name');
      
      final results = response.map((service) => ServicesModel.fromJson(service)).toList();
      
      _logger.info('Found ${results.length} services matching query', tag: 'HomeownerServicesProvider');
      
      return results;
    } catch (e) {
      _logger.error('Error searching services: ${e.toString()}', tag: 'HomeownerServicesProvider', error: e);
      return [];
    }
  }

  /// Gets services by category
  Future<List<ServicesModel>> getServicesByCategory(String categoryId) async {
    if (categoryId.isEmpty) {
      return _availableServices;
    }
    
    try {
      _logger.info('Getting services for category: $categoryId', tag: 'HomeownerServicesProvider');
      
      final response = await _client
          .from('services')
          .select('*, service_categories(*)')
          .eq('is_active', true)
          .eq('category_id', categoryId)
          .order('name');
      
      final results = response.map((service) => ServicesModel.fromJson(service)).toList();
      
      _logger.info('Found ${results.length} services in category', tag: 'HomeownerServicesProvider');
      
      return results;
    } catch (e) {
      _logger.error('Error getting services by category: ${e.toString()}', 
          tag: 'HomeownerServicesProvider', error: e);
      return [];
    }
  }

  /// Gets a service by ID
  ServicesModel? getServiceById(String serviceId) {
    return _availableServices.firstWhere(
      (service) => service.serviceId == serviceId,
      orElse: () => null as ServicesModel,
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
    _logger.error('$message: $errorMessage', tag: 'HomeownerServicesProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 