import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';
import '../auth/forgot_password_screen.dart';
import '../shared/users_screen.dart';
import '../homeowner/screens/homeowner_home_screen.dart';
import '../professional/screens/professional_home_screen.dart';
import '../services/logger_service.dart';

/// Router for handling navigation in the app
class AppRouter {
  static final LoggerService _logger = LoggerService();

  static const String home = '/';
  static const String homeownerHome = '/homeowner';
  static const String professionalHome = '/professional';
  static const String signIn = '/signin';
  static const String signUp = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String users = '/users';

  static String get initial => signIn;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    _logger.info('Generating route for: ${settings.name}', tag: 'AppRouter');

    switch (settings.name) {
      case home:
        _logger.debug('Navigating to home route', tag: 'AppRouter');
        return MaterialPageRoute(builder: (context) => _getHomeScreen(context));
      case homeownerHome:
        _logger.debug('Navigating to HomeownerHomeScreen', tag: 'AppRouter');
        return MaterialPageRoute(builder: (_) => const HomeownerHomeScreen());
      case professionalHome:
        _logger.debug('Navigating to ProfessionalHomeScreen', tag: 'AppRouter');
        return MaterialPageRoute(
          builder: (_) => const ProfessionalHomeScreen(),
        );
      case signIn:
        _logger.debug('Navigating to SignInScreen', tag: 'AppRouter');
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        _logger.debug('Navigating to SignUpScreen', tag: 'AppRouter');
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPassword:
        _logger.debug('Navigating to ForgotPasswordScreen', tag: 'AppRouter');
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case users:
        _logger.debug('Navigating to UsersScreen', tag: 'AppRouter');
        return MaterialPageRoute(builder: (_) => const UsersScreen());
      default:
        _logger.warning(
          'No route defined for: ${settings.name}',
          tag: 'AppRouter',
        );
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }

  static Widget getInitialScreen(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final isAuthenticated = authProvider.isAuthenticated;

    _logger.info(
      'Determining initial screen, isAuthenticated: $isAuthenticated',
      tag: 'AppRouter',
    );

    if (isAuthenticated) {
      return _getHomeScreen(context);
    } else {
      _logger.info(
        'User is not authenticated, showing SignInScreen',
        tag: 'AppRouter',
      );
      return const SignInScreen();
    }
  }

  static Widget _getHomeScreen(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userType = authProvider.userType;

    _logger.info(
      'Determining home screen based on user type: $userType',
      tag: 'AppRouter',
    );

    if (authProvider.isHomeowner) {
      _logger.info(
        'User is a homeowner, showing HomeownerHomeScreen',
        tag: 'AppRouter',
      );
      return const HomeownerHomeScreen();
    } else if (authProvider.isProfessional) {
      _logger.info(
        'User is a professional, showing ProfessionalHomeScreen',
        tag: 'AppRouter',
      );
      return const ProfessionalHomeScreen();
    } else {
      // If user type is not set or unknown, show a default screen
      _logger.warning(
        'Unknown user type: $userType, showing default home screen',
        tag: 'AppRouter',
      );
      return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await authProvider.signOut();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'User type not recognized',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text('Current user type: ${userType ?? "Not set"}'),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  authProvider.signOut();
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
