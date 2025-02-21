import 'package:every_watch/core/constants/validation_contants.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewModel extends Cubit<AuthState> {
  SignUpViewModel() : super(AuthInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();

  String? validateInputs() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final inviteCode = inviteCodeController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      return "Please fill all the required fields!";
    }

    if (!RegExp(ValidationConstants.emailPattern).hasMatch(email)) {
      return "Enter a valid email address";
    }

    if (password.length < ValidationConstants.passwordMinLength) {
      return "Password must be at least ${ValidationConstants.passwordMinLength} characters";
    }

    if (!RegExp(ValidationConstants.namePattern).hasMatch(firstName)) {
      return "First name must contain only letters.";
    }

    if (!RegExp(ValidationConstants.namePattern).hasMatch(lastName)) {
      return "Last name must contain only letters.";
    }

    if (inviteCode.isNotEmpty && inviteCode.length < 6) {
      return "Invitation code must be at least 6 characters if provided.";
    }

    return null; // No errors
  }

  void signUp(BuildContext context) {
    final errorMessage = validateInputs();
    if (errorMessage != null) {
      emit(
        AuthError(
          errorMessage,
          isValidationError: true,
        ),
      ); // Emit error state if validation fails
      return;
    } else {
      emit(AuthLoading());
      context.read<AuthBloc>().add(
            AuthSignUp(
              email: emailController.text,
              password: passwordController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              invitationCode: inviteCodeController.text,
            ),
          );
    }
  }

  void handleAuthState(AuthState state) {
    emit(state); // Forward AuthBloc state changes to UI
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    inviteCodeController.dispose();
    return super.close();
  }
}
