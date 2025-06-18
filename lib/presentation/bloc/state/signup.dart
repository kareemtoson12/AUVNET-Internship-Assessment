import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final dynamic error;
  final bool isSuccess;

  const SignUpState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  SignUpState copyWith({bool? isLoading, dynamic error, bool? isSuccess}) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, isSuccess];
}
