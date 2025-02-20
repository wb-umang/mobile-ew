import 'package:every_watch/core/common/entities/user.dart';
import 'package:every_watch/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignupUsecase _userSignupUsecase;

  AuthBloc({required UserSignupUsecase userSignupUsecase})
      : _userSignupUsecase = userSignupUsecase,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignupUsecase(UserSignUpParams(
        email: event.email,
        name: event.name,
        password: event.password,
      ));

      res.fold((failure) {
        emit(AuthError(failure.message));
      }, (success) {
        emit(AuthSuccess(success));
      });
    });
  }
}
