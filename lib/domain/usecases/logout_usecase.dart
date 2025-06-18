import 'package:nawel/domain/repos/logout_repo.dart';

class LogoutUseCase {
  final LogoutRepository repository;
  LogoutUseCase(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}
