// lib/data/repositories/auth_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/domain/repos/login_repo.dart';
import 'package:nawel/data/services/local_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<void> login(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save user data to local storage
    if (userCredential.user != null) {
      await LocalStorageService.updateLoginStatus(
        isLoggedIn: true,
        email: email,
        uid: userCredential.user!.uid,
      );
    }
  }
}
