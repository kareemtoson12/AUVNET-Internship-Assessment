import 'package:flutter/material.dart';
import '../presentation/routes/app_router.dart';
import '../presentation/routes/app_routes.dart';
import '../data/services/local_storage_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: _getInitialRoute(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }

  String _getInitialRoute() {
    // Check if user is already logged in
    if (LocalStorageService.isUserLoggedIn()) {
      return AppRoutes.home;
    }
    return AppRoutes.onboarding;
  }
}
