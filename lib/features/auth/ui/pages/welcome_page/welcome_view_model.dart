import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeViewModel extends Cubit<AuthState> {
  WelcomeViewModel() : super(AuthInitial());

  void signInWithGoogle(BuildContext context) {
    emit(AuthLoading());
    context.read<AuthBloc>().add(
          AuthSignInWithGoogle(),
        );
  }

  void signInWithApple(BuildContext context) {
    emit(AuthLoading());
    context.read<AuthBloc>().add(
          AuthSignInWithApple(),
        );
  }

  void handleAuthState(AuthState state) {
    emit(state); // Forward AuthBloc state changes to UI
  }
}
