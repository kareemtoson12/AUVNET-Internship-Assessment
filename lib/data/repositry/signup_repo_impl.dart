import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/domain/repos/signup_repo.dart';
import 'package:nawel/data/services/local_storage_service.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth firebaseAuth;
  SignUpRepositoryImpl(this.firebaseAuth);

  @override
  Future<void> signUp(String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
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
