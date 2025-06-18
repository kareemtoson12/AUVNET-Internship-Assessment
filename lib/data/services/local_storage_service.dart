import 'package:hive_flutter/hive_flutter.dart';
import 'package:nawel/domain/model/user_model.dart';

class LocalStorageService {
  static const String _userBoxName = 'user_box';
  static const String _userKey = 'current_user';
  static const String _onboardingKey = 'onboarding_complete';

  static Box<UserModel>? _userBox;
  static Box? _prefsBox;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(UserModelAdapter());

    // Open boxes
    _userBox = await Hive.openBox<UserModel>(_userBoxName);
    _prefsBox = await Hive.openBox('app_prefs');
  }

  // Save user data
  static Future<void> saveUser(UserModel user) async {
    await _userBox?.put(_userKey, user);
  }

  // Get user data
  static UserModel? getUser() {
    return _userBox?.get(_userKey);
  }

  // Check if user is logged in
  static bool isUserLoggedIn() {
    final user = getUser();
    return user?.isLoggedIn ?? false;
  }

  // Get user email
  static String? getUserEmail() {
    final user = getUser();
    return user?.email;
  }

  // Get user UID
  static String? getUserUid() {
    final user = getUser();
    return user?.uid;
  }

  // Update user login status
  static Future<void> updateLoginStatus({
    required bool isLoggedIn,
    String? email,
    String? uid,
  }) async {
    final currentUser = getUser() ?? UserModel();
    final updatedUser = currentUser.copyWith(
      isLoggedIn: isLoggedIn,
      email: email ?? currentUser.email,
      uid: uid ?? currentUser.uid,
      lastLoginTime: isLoggedIn ? DateTime.now() : null,
    );
    await saveUser(updatedUser);
  }

  // Clear user data (logout)
  static Future<void> clearUser() async {
    await _userBox?.delete(_userKey);
    // Also clear the box completely to ensure no residual data
    await _userBox?.clear();
  }

  // Check if user data exists
  static bool hasUserData() {
    return _userBox?.get(_userKey) != null;
  }

  // Onboarding methods
  static Future<void> setOnboardingComplete(bool value) async {
    await _prefsBox?.put(_onboardingKey, value);
  }

  static Future<bool> isOnboardingComplete() async {
    return _prefsBox?.get(_onboardingKey, defaultValue: false) ?? false;
  }

  // Close Hive boxes
  static Future<void> close() async {
    await _userBox?.close();
    await _prefsBox?.close();
  }
}
