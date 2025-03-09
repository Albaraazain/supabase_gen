import 'package:flutter/material.dart';
import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';
import '../auth/forgot_password_screen.dart';
import '../professional/screens/professional_home_screen.dart';
import '../homeowner/screens/homeowner_home_screen.dart';

class AppRouter {
  static const String signIn = '/';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String professionalHome = '/professional/home';
  static const String homeownerHome = '/homeowner/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case signUp:
        final userType = (settings.arguments as String?) ?? 'homeowner';
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(initialUserType: userType),
        );

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case professionalHome:
        return MaterialPageRoute(
          builder: (_) => const ProfessionalHomeScreen(),
        );

      case homeownerHome:
        return MaterialPageRoute(builder: (_) => const HomeownerHomeScreen());

      default:
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

  static void navigateToHomeBasedOnUserType(
    BuildContext context,
    String userType,
  ) {
    switch (userType.toLowerCase()) {
      case 'professional':
        Navigator.of(context).pushReplacementNamed(professionalHome);
        break;
      case 'homeowner':
        Navigator.of(context).pushReplacementNamed(homeownerHome);
        break;
      default:
        Navigator.of(context).pushReplacementNamed(signIn);
    }
  }
}
