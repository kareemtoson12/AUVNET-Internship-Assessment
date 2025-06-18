import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/domain/repos/logout_repo.dart';
import 'package:nawel/data/services/local_storage_service.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final FirebaseAuth firebaseAuth;
  LogoutRepositoryImpl(this.firebaseAuth);

  @override
  Future<void> logout() async {
    // Sign out from Firebase
    await firebaseAuth.signOut();

    // Clear local storage
    await LocalStorageService.clearUser();
  }
}
