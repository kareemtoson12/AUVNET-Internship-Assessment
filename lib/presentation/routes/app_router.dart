import 'package:flutter/material.dart';
import 'package:nawel/presentation/routes/app_routes.dart';
import 'package:nawel/presentation/screens/home/home.dart';
import 'package:nawel/presentation/screens/login/login_screen.dart';
import 'package:nawel/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:nawel/presentation/screens/signUp/SignUpScreen.dart';
import 'package:nawel/presentation/screens/splash/splash_screen.dart';
import 'package:nawel/presentation/screens/services/food_screen.dart';
import 'package:nawel/presentation/screens/services/health_screen.dart';
import 'package:nawel/presentation/screens/services/groceries_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
