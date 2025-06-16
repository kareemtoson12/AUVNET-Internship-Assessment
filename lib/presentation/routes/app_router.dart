import 'package:flutter/material.dart';
import 'package:nawel/presentation/screens/login/login_screen.dart';
import 'package:nawel/presentation/screens/signUp/SignUpScreen.dart';
import 'app_routes.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const LoginScreen(), // Assuming you have a LoginScreen widget
        );
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // Add more routes as needed
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
}
