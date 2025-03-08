import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../generated/repositories/homeowner_profiles_repository.dart';
import '../../generated/models/homeowner_profiles_model.dart';
import '../../services/logger_service.dart';

/// Provider for managing homeowner profile data
class HomeownerProfileProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final HomeownerProfilesRepository _repository;
  
  HomeownerProfilesModel? _profile;
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [HomeownerProfileProvider]
  HomeownerProfileProvider(this._client) 
      : _repository = HomeownerProfilesRepository(_client) {
    _logger.info('HomeownerProfileProvider initialized', tag: 'HomeownerProfileProvider');
  }

  /// The homeowner profile
  HomeownerProfilesModel? get profile => _profile;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;
  
  /// Whether the homeowner has a profile
  bool get hasProfile => _profile != null;

  /// Loads the homeowner profile for the given user ID
  Future<void> loadProfile(String userId) async {
    if (userId.isEmpty) {
      _logger.warning('Cannot load profile: userId is empty', tag: 'HomeownerProfileProvider');
      return;
    }
    
    _setLoading(true);

    try {
      _logger.info('Loading homeowner profile for user: $userId', tag: 'HomeownerProfileProvider');
      
      // First, try to find an existing profile
      final response = await _client
          .from('homeowner_profiles')
          .select()
          .eq('user_id', userId)
          .maybeSingle();
      
      if (response != null) {
        _profile = HomeownerProfilesModel.fromJson(response);
        _logger.info('Homeowner profile loaded: ${_profile?.homeownerId}', tag: 'HomeownerProfileProvider');
      } else {
        _logger.info('No homeowner profile found for user: $userId', tag: 'HomeownerProfileProvider');
        _profile = null;
      }
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading homeowner profile', e);
    }
  }

  /// Creates a new homeowner profile for the given user ID
  Future<HomeownerProfilesModel?> createProfile(String userId, {String? preferredLanguage}) async {
    if (userId.isEmpty) {
      _logger.warning('Cannot create profile: userId is empty', tag: 'HomeownerProfileProvider');
      return null;
    }
    
    _setLoading(true);

    try {
      _logger.info('Creating homeowner profile for user: $userId', tag: 'HomeownerProfileProvider');
      
      // Create a new profile
      final newProfile = HomeownerProfilesModel(
        homeownerId: 'ho_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        preferredLanguage: preferredLanguage,
        notificationPreferences: {'email': true, 'push': true},
      );
      
      final createdProfile = await _repository.insert(newProfile);
      _profile = createdProfile;
      
      _logger.info('Homeowner profile created: ${_profile?.homeownerId}', tag: 'HomeownerProfileProvider');
      
      _setLoading(false);
      return createdProfile;
    } catch (e) {
      _handleError('Error creating homeowner profile', e);
      return null;
    }
  }

  /// Updates an existing homeowner profile
  Future<HomeownerProfilesModel?> updateProfile(HomeownerProfilesModel updatedProfile) async {
    _setLoading(true);

    try {
      _logger.info('Updating homeowner profile: ${updatedProfile.homeownerId}', tag: 'HomeownerProfileProvider');
      
      final result = await _repository.update(updatedProfile);
      if (result != null) {
        _profile = result;
        _logger.info('Homeowner profile updated successfully', tag: 'HomeownerProfileProvider');
      } else {
        throw Exception('Failed to update profile');
      }
      
      _setLoading(false);
      return result;
    } catch (e) {
      _handleError('Error updating homeowner profile', e);
      return null;
    }
  }

  /// Updates notification preferences for the homeowner
  Future<bool> updateNotificationPreferences(Map<String, dynamic> preferences) async {
    if (_profile == null) {
      _logger.warning('Cannot update preferences: profile not loaded', tag: 'HomeownerProfileProvider');
      return false;
    }
    
    try {
      _logger.info('Updating notification preferences', tag: 'HomeownerProfileProvider');
      
      final updatedProfile = _profile!.copyWith(
        notificationPreferences: preferences,
      );
      
      final result = await updateProfile(updatedProfile);
      return result != null;
    } catch (e) {
      _logger.error('Error updating notification preferences: ${e.toString()}', 
          tag: 'HomeownerProfileProvider', error: e);
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
    _logger.error('$message: $errorMessage', tag: 'HomeownerProfileProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 