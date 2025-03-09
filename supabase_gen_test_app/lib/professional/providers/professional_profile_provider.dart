import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/professional_profiles_repository.dart';
import '../../generated/models/professional_profiles_model.dart';
import '../../services/logger_service.dart';

/// Provider for managing professional profile data
class ProfessionalProfileProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final ProfessionalProfilesRepository _repository;
  
  ProfessionalProfilesModel? _profile;
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [ProfessionalProfileProvider]
  ProfessionalProfileProvider(this._client) 
      : _repository = ProfessionalProfilesRepository(_client) {
    _logger.info('ProfessionalProfileProvider initialized', tag: 'ProfessionalProfileProvider');
  }

  /// The professional profile
  ProfessionalProfilesModel? get profile => _profile;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;
  
  /// Whether the professional has a profile
  bool get hasProfile => _profile != null;

  /// Loads the professional profile for the given user ID
  Future<void> loadProfile(String userId) async {
    if (userId.isEmpty) {
      _logger.warning('Cannot load profile: userId is empty', tag: 'ProfessionalProfileProvider');
      return;
    }
    
    _setLoading(true);

    try {
      _logger.info('Loading professional profile for user: $userId', tag: 'ProfessionalProfileProvider');
      
      // First, try to find an existing profile
      final response = await _repository.query
          .select()
          .eq('user_id', userId)
          .maybeSingle();
      
      if (response != null) {
        _profile = ProfessionalProfilesModel.fromJson(response);
        _logger.info('Professional profile loaded: ${_profile?.professionalId}', tag: 'ProfessionalProfileProvider');
      } else {
        _logger.info('No professional profile found for user: $userId', tag: 'ProfessionalProfileProvider');
        _profile = null;
      }
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading professional profile', e);
    }
  }

  /// Creates a new professional profile for the given user ID
  Future<ProfessionalProfilesModel?> createProfile(String userId, {
    String? businessName,
    int? experienceYears,
    String? licenseNumber,
    int serviceRadius = 25,
  }) async {
    if (userId.isEmpty) {
      _logger.warning('Cannot create profile: userId is empty', tag: 'ProfessionalProfileProvider');
      return null;
    }
    
    _setLoading(true);

    try {
      _logger.info('Creating professional profile for user: $userId', tag: 'ProfessionalProfileProvider');
      
      // Create a new profile
      final newProfile = ProfessionalProfilesModel(
        professionalId: 'pro_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        businessName: businessName,
        experienceYears: experienceYears,
        licenseNumber: licenseNumber,
        serviceRadius: serviceRadius,
        rating: 0.0,
        totalJobsCompleted: 0,
        acceptanceRate: 0.0,
        availabilityStatus: 'available',
      );
      
      final createdProfile = await _repository.insert(newProfile);
      _profile = createdProfile;
      
      _logger.info('Professional profile created: ${_profile?.professionalId}', tag: 'ProfessionalProfileProvider');
      
      _setLoading(false);
      return createdProfile;
    } catch (e) {
      _handleError('Error creating professional profile', e);
      return null;
    }
  }

  /// Updates an existing professional profile
  Future<ProfessionalProfilesModel?> updateProfile(ProfessionalProfilesModel updatedProfile) async {
    _setLoading(true);

    try {
      _logger.info('Updating professional profile: ${updatedProfile.professionalId}', tag: 'ProfessionalProfileProvider');
      
      final result = await _repository.update(updatedProfile);
      if (result != null) {
        _profile = result;
        _logger.info('Professional profile updated successfully', tag: 'ProfessionalProfileProvider');
      } else {
        throw Exception('Failed to update profile');
      }
      
      _setLoading(false);
      return result;
    } catch (e) {
      _handleError('Error updating professional profile', e);
      return null;
    }
  }

  /// Updates the availability status of the professional
  Future<bool> updateAvailabilityStatus(String status) async {
    if (_profile == null) {
      _logger.warning('Cannot update availability: profile not loaded', tag: 'ProfessionalProfileProvider');
      return false;
    }
    
    try {
      _logger.info('Updating availability status to: $status', tag: 'ProfessionalProfileProvider');
      
      final updatedProfile = _profile!.copyWith(
        availabilityStatus: status,
      );
      
      final result = await updateProfile(updatedProfile);
      return result != null;
    } catch (e) {
      _logger.error('Error updating availability status: ${e.toString()}', 
          tag: 'ProfessionalProfileProvider', error: e);
      return false;
    }
  }

  /// Updates the current location of the professional
  Future<bool> updateLocation(double latitude, double longitude) async {
    if (_profile == null) {
      _logger.warning('Cannot update location: profile not loaded', tag: 'ProfessionalProfileProvider');
      return false;
    }
    
    try {
      _logger.info('Updating location to: $latitude, $longitude', tag: 'ProfessionalProfileProvider');
      
      final updatedProfile = _profile!.copyWith(
        currentLocationLat: latitude,
        currentLocationLng: longitude,
      );
      
      final result = await updateProfile(updatedProfile);
      return result != null;
    } catch (e) {
      _logger.error('Error updating location: ${e.toString()}', 
          tag: 'ProfessionalProfileProvider', error: e);
      return false;
    }
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
    _logger.error('$message: $errorMessage', tag: 'ProfessionalProfileProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 