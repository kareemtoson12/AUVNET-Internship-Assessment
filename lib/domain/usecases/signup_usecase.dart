import 'package:nawel/domain/repos/signup_repo.dart';

class SignUpUseCase {
  final SignUpRepository repository;
  SignUpUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signUp(email, password);
  }
}
