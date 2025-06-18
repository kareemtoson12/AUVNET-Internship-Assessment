import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/presentation/bloc/events/signup.dart';
import 'package:nawel/presentation/bloc/state/signup.dart';

import '../../../domain/usecases/signup_usecase.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc(this.signUpUseCase) : super(const SignUpState()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    try {
      await signUpUseCase(event.email, event.password);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e, isSuccess: false));
    }
  }
}
