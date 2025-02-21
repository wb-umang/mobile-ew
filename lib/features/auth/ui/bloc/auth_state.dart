part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserEntity user;

  const AuthSuccess(this.user);
}

final class AuthError extends AuthState {
  final String message;
  final bool isValidationError;

  const AuthError(this.message, {this.isValidationError = false});
}
