import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../generated/repositories/users_repository.dart';
import '../generated/models/users_model.dart';
import '../services/logger_service.dart';

/// Provider for managing authentication state and user data
class AuthProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  User? _user;
  bool _isLoading = false;
  String? _error;
  String? _userType;

  AuthProvider(this._client) {
    _init();
  }

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;
  String? get userType => _userType;
  bool get isHomeowner => _userType == 'homeowner';
  bool get isProfessional => _userType == 'professional';

  void _init() {
    _user = _client.auth.currentUser;
    _logger.info('AuthProvider initialized, current user: ${_user?.email ?? 'null'}', tag: 'AuthProvider');
    
    if (_user != null) {
      _fetchUserType();
    }
    
    _client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      
      _logger.info('Auth state changed: $event, user: ${session?.user?.email ?? 'null'}', tag: 'AuthProvider');
      
      if (event == AuthChangeEvent.signedIn || event == AuthChangeEvent.userUpdated) {
        _user = session?.user;
        _logger.info('User signed in/updated: ${_user?.email}', tag: 'AuthProvider');
        _fetchUserType();
        notifyListeners();
      } else if (event == AuthChangeEvent.signedOut) {
        _user = null;
        _userType = null;
        _logger.info('User signed out', tag: 'AuthProvider');
        notifyListeners();
      } else {
        _logger.info('Other auth event: $event', tag: 'AuthProvider');
      }
    });
  }

  Future<void> _fetchUserType() async {
    _logger.debug('Fetching user type for: ${_user?.email}', tag: 'AuthProvider');
    
    try {
      // First try to get from metadata
      final userType = _user?.userMetadata?['user_type'];
      if (userType != null) {
        _userType = userType.toString();
        _logger.info('User type from metadata: $_userType', tag: 'AuthProvider');
        notifyListeners();
        return;
      }
      
      // If not in metadata, try to get from database
      final userId = _user?.id;
      if (userId != null) {
        final response = await _client
            .from('users')
            .select('user_type')
            .eq('id', userId)
            .single();
        
        if (response != null) {
          _userType = response['user_type'];
          _logger.info('User type from database: $_userType', tag: 'AuthProvider');
          notifyListeners();
        } else {
          _logger.warning('No user type found in database', tag: 'AuthProvider');
        }
      } else {
        _logger.warning('User ID is null', tag: 'AuthProvider');
      }
    } catch (e) {
      _logger.error('Error fetching user type: ${e.toString()}', tag: 'AuthProvider', error: e);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    String userType = 'homeowner', // Default user type
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _logger.info('Attempting to sign up user: $email with type: $userType', tag: 'AuthProvider');
      
      // Sign up the user
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'user_type': userType,
        },
      );

      _logger.debug('Sign up response: user=${response.user != null}, session=${response.session != null}', tag: 'AuthProvider');

      if (response.user == null) {
        throw Exception('Failed to sign up');
      }

      _user = response.user;
      _userType = userType; // Set user type immediately
      _logger.info('User signed up successfully: ${_user?.email} as $userType', tag: 'AuthProvider');
      
      // Check if email confirmation is required
      if (response.session == null) {
        _logger.info('Email confirmation required for: ${_user?.email}', tag: 'AuthProvider');
      }
      
      // Insert user data into the users table
      if (response.user != null) {
        try {
          await _client.from('users').insert({
            'user_id': response.user!.id,
            'email': email,
            'full_name': fullName,
            'user_type': userType,
          });
          _logger.info('User data inserted into database', tag: 'AuthProvider');
        } catch (dbError) {
          _logger.error('Error inserting user data: ${dbError.toString()}', tag: 'AuthProvider', error: dbError);
        }
      }
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _logger.error('Sign up error: $_error', tag: 'AuthProvider', error: e);
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _logger.info('Attempting to sign in user: $email', tag: 'AuthProvider');
      
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      _logger.debug('Sign in response: user=${response.user != null}, session=${response.session != null}', tag: 'AuthProvider');

      if (response.user == null) {
        throw Exception('Failed to sign in');
      }

      _user = response.user;
      _logger.info('User signed in successfully: ${_user?.email}', tag: 'AuthProvider');
      
      // Fetch user type after sign in
      await _fetchUserType();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _logger.error('Sign in error: $_error', tag: 'AuthProvider', error: e);
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    try {
      _logger.info('Attempting to sign out user: ${_user?.email}', tag: 'AuthProvider');
      await _client.auth.signOut();
      _user = null;
      _userType = null;
      _logger.info('User signed out successfully', tag: 'AuthProvider');
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _logger.error('Sign out error: $_error', tag: 'AuthProvider', error: e);
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _logger.info('Attempting to reset password for: $email', tag: 'AuthProvider');
      await _client.auth.resetPasswordForEmail(email);
      _logger.info('Password reset email sent to: $email', tag: 'AuthProvider');
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _logger.error('Password reset error: $_error', tag: 'AuthProvider', error: e);
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
} 