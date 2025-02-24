import 'package:every_watch/core/constants/validation_contants.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<AuthState> {
  LoginViewModel() : super(AuthInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateInputs() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return "Email and password cannot be empty";
    }

    if (!RegExp(ValidationConstants.emailPattern).hasMatch(email)) {
      return "Enter a valid email address";
    }

    if (password.length < ValidationConstants.passwordMinLength) {
      return "Password must be at least ${ValidationConstants.passwordMinLength} characters";
    }

    return null; // No errors
  }

  void login(BuildContext context) {
    final errorMessage = validateInputs();
    if (errorMessage != null) {
      emit(
        AuthError(
          errorMessage,
          isValidationError: true,
        ),
      );
      return;
    } else {
      emit(AuthLoading());
      context.read<AuthBloc>().add(
            AuthLogin(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }

  void signInWithGoogle(BuildContext context) {
    emit(AuthLoading());
    context.read<AuthBloc>().add(
          AuthSignInWithGoogle(),
        );
  }

  void handleAuthState(AuthState state) {
    emit(state); // Forward AuthBloc state changes to UI
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
