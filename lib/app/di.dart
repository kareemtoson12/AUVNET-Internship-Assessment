// Example in main.dart or a di.dart file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/data/repositry/repo_impl.dart';
import 'package:nawel/domain/usecases/login_usecase.dart';
import 'package:nawel/presentation/bloc/logic/auth.dart';

final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
final loginUseCase = LoginUseCase(authRepository);
final authBloc = AuthBloc(loginUseCase);
