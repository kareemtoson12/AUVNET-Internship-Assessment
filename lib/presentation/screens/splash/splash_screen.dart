import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/data/services/local_storage_service.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAppropriateScreen();
  }

  Future<void> _navigateToAppropriateScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is logged in
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final isLoggedInLocally = LocalStorageService.isUserLoggedIn();

    // Check if onboarding has been completed
    final onboardingComplete = await LocalStorageService.isOnboardingComplete();

    if (firebaseUser != null && isLoggedInLocally) {
      // User is logged in, go to home
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (!onboardingComplete) {
      // First time user, show onboarding
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    } else {
      // User not logged in but has seen onboarding, go to login
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/images/nawel.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
