// lib/presentation/bloc/auth/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/presentation/bloc/events/auth.dart';
import 'package:nawel/presentation/bloc/state/auth.dart';

import '../../../domain/usecases/login_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    try {
      await loginUseCase(event.email, event.password);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: e.toString(), isSuccess: false),
      );
    }
  }
}
