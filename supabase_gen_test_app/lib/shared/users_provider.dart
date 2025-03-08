import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../generated/repositories/users_repository.dart';
import '../generated/models/users_model.dart';
import '../services/logger_service.dart';

/// Provider for managing users data
class UsersProvider extends ChangeNotifier {
  final SupabaseClient _client;
  final LoggerService _logger = LoggerService();
  final UsersRepository _repository;
  
  List<UsersModel> _users = [];
  bool _isLoading = false;
  String? _error;

  /// Creates a new instance of [UsersProvider]
  UsersProvider(this._client) 
      : _repository = UsersRepository(_client) {
    _logger.info('UsersProvider initialized', tag: 'UsersProvider');
  }

  /// The list of users
  List<UsersModel> get users => _users;
  
  /// Whether the provider is currently loading data
  bool get isLoading => _isLoading;
  
  /// The most recent error message, if any
  String? get error => _error;

  /// Loads all users
  Future<void> loadUsers() async {
    _setLoading(true);

    try {
      _logger.info('Loading users', tag: 'UsersProvider');
      
      final response = await _client
          .from('users')
          .select()
          .order('created_at', ascending: false);
      
      _users = response.map((user) => UsersModel.fromJson(user)).toList();
      
      _logger.info('Loaded ${_users.length} users', tag: 'UsersProvider');
      
      _setLoading(false);
    } catch (e) {
      _handleError('Error loading users', e);
    }
  }

  /// Gets a user by ID
  UsersModel? getUserById(String userId) {
    return _users.firstWhere(
      (user) => user.userId == userId,
      orElse: () => null as UsersModel,
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
    _logger.error('$message: $errorMessage', tag: 'UsersProvider', error: error);
    _isLoading = false;
    notifyListeners();
  }
} 