// lib/domain/repositories/signup_repository.dart
abstract class SignUpRepository {
  Future<void> signUp(String email, String password);
}
