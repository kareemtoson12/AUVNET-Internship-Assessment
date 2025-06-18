// Example in main.dart or a di.dart file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/data/repositry/repo_impl.dart';
import 'package:nawel/data/repositry/signup_repo_impl.dart';
import 'package:nawel/data/repositry/logout_repo_impl.dart';
import 'package:nawel/domain/usecases/login_usecase.dart';
import 'package:nawel/domain/usecases/signup_usecase.dart';
import 'package:nawel/domain/usecases/logout_usecase.dart';
import 'package:nawel/presentation/bloc/logic/auth.dart';
import 'package:nawel/presentation/bloc/logic/signup.dart';

final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
final signUpRepository = SignUpRepositoryImpl(FirebaseAuth.instance);
final logoutRepository = LogoutRepositoryImpl(FirebaseAuth.instance);
final loginUseCase = LoginUseCase(authRepository);
final signUpUseCase = SignUpUseCase(signUpRepository);
final logoutUseCase = LogoutUseCase(logoutRepository);
final authBloc = AuthBloc(loginUseCase);
final signUpBloc = SignUpBloc(signUpUseCase);
