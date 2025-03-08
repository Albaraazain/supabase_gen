import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import '../router/app_router.dart';
import '../services/logger_service.dart';
import '../widgets/auth_form_field.dart';

/// Screen for user registration
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final LoggerService _logger = LoggerService();
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _userType = 'homeowner';

  @override
  void initState() {
    super.initState();
    _logger.info('SignUpScreen initialized', tag: 'SignUpScreen');
  }

  @override
  void dispose() {
    _logger.info('SignUpScreen disposed', tag: 'SignUpScreen');
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    _logger.info('Sign up button pressed', tag: 'SignUpScreen');
    
    if (_formKey.currentState!.validate()) {
      _logger.debug('Form validation passed', tag: 'SignUpScreen');
      
      try {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        _logger.debug('Calling authProvider.signUp with user type: $_userType', tag: 'SignUpScreen');
        
        await authProvider.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          fullName: _fullNameController.text.trim(),
          userType: _userType,
        );
        
        _logger.debug('authProvider.signUp completed successfully', tag: 'SignUpScreen');
        _logger.debug('isAuthenticated: ${authProvider.isAuthenticated}, userType: ${authProvider.userType}', tag: 'SignUpScreen');
        
        // Check if we're still mounted after the async operation
        if (mounted) {
          _logger.debug('Widget is still mounted, checking if navigation is needed', tag: 'SignUpScreen');
          
          // Manually navigate if needed
          if (authProvider.isAuthenticated) {
            _logger.info('User is authenticated, navigating to home', tag: 'SignUpScreen');
            
            // Navigate to the appropriate home screen based on user type
            if (authProvider.isHomeowner) {
              _logger.info('Navigating to homeowner home screen', tag: 'SignUpScreen');
              Navigator.pushReplacementNamed(context, AppRouter.homeownerHome);
            } else if (authProvider.isProfessional) {
              _logger.info('Navigating to professional home screen', tag: 'SignUpScreen');
              Navigator.pushReplacementNamed(context, AppRouter.professionalHome);
            } else {
              _logger.info('Navigating to default home screen', tag: 'SignUpScreen');
              Navigator.pushReplacementNamed(context, AppRouter.home);
            }
          } else {
            _logger.info('User is not authenticated after sign up (may need email confirmation)', tag: 'SignUpScreen');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please check your email to confirm your account')),
            );
          }
        } else {
          _logger.warning('Widget is no longer mounted after sign up', tag: 'SignUpScreen');
        }
      } catch (e) {
        _logger.error('Sign up error: ${e.toString()}', tag: 'SignUpScreen', error: e);
        
        // Error is already handled in the provider
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign up failed: ${e.toString()}')),
          );
        }
      }
    } else {
      _logger.warning('Form validation failed', tag: 'SignUpScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    _logger.debug('SignUpScreen build, isAuthenticated: ${authProvider.isAuthenticated}', tag: 'SignUpScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person_add,
                  size: 80,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Create an Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                AuthFormField(
                  controller: _fullNameController,
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AuthFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AuthFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AuthFormField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'User Type',
                    prefixIcon: const Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  value: _userType,
                  items: const [
                    DropdownMenuItem(
                      value: 'homeowner',
                      child: Text('Homeowner'),
                    ),
                    DropdownMenuItem(
                      value: 'professional',
                      child: Text('Professional'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _logger.debug('User type changed to: $value', tag: 'SignUpScreen');
                      setState(() {
                        _userType = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: authProvider.isLoading ? null : _signUp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: authProvider.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        _logger.debug('Navigating to sign in screen', tag: 'SignUpScreen');
                        Navigator.pushReplacementNamed(context, AppRouter.signIn);
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 