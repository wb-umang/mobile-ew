part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);
}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}
