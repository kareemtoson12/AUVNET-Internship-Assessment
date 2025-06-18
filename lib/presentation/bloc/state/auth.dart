// lib/presentation/bloc/auth/auth_state.dart
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const AuthState({this.isLoading = false, this.error, this.isSuccess = false});

  AuthState copyWith({bool? isLoading, String? error, bool? isSuccess}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, isSuccess];
}
