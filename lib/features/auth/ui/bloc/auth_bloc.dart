import 'package:every_watch/app_state.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:every_watch/core/utils/temp/map_to_login_data_struct.dart';
import 'package:every_watch/features/auth/domain/usecases/sign_in_with_apple.dart';
import 'package:every_watch/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:every_watch/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:every_watch/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignupUsecase _userSignupUsecase;
  final UserLoginUsecase _userLoginUsecase;
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final SignInWithAppleUsecase _signInWithAppleUsecase;

  AuthBloc({
    required UserSignupUsecase userSignupUsecase,
    required UserLoginUsecase userLoginUsecase,
    required SignInWithGoogleUsecase signInWithGoogleUsecase,
    required SignInWithAppleUsecase signInWithAppleUsecase,
  })  : _userSignupUsecase = userSignupUsecase,
        _userLoginUsecase = userLoginUsecase,
        _signInWithGoogleUsecase = signInWithGoogleUsecase,
        _signInWithAppleUsecase = signInWithAppleUsecase,
        super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      final res = await _userLoginUsecase(UserLoginParams(
        email: event.email,
        password: event.password,
      ));

      res.fold((failure) {
        emit(AuthError(failure.message));
      }, (result) {
        // TODO: Remove this temporary solution after full new arch. migration
        FFAppState().loginData = mapUserEntityToLoginData(result);
        emit(AuthSuccess(result));
      });
    });

    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignupUsecase(UserSignUpParams(
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
        invitationCode: event.invitationCode,
      ));

      res.fold((failure) {
        emit(AuthError(failure.message));
      }, (result) {
        // TODO: Remove this temporary solution after full new arch. migration
        FFAppState().loginData = mapUserEntityToLoginData(result);
        emit(AuthSuccess(result));
      });
    });

    on<AuthSignInWithGoogle>((event, emit) async {
      emit(AuthLoading(isGoogleLogin: true));
      final res = await _signInWithGoogleUsecase(null);

      res.fold((failure) {
        emit(AuthError(failure.message));
      }, (result) {
        // TODO: Remove this temporary solution after full new arch. migration
        FFAppState().loginData = mapUserEntityToLoginData(result);
        emit(AuthSuccess(result));
      });
    });

    on<AuthSignInWithApple>((event, emit) async {
      emit(AuthLoading(isGoogleLogin: true));
      final res = await _signInWithAppleUsecase(null);

      res.fold((failure) {
        emit(AuthError(failure.message));
      }, (result) {
        // TODO: Remove this temporary solution after full new arch. migration
        FFAppState().loginData = mapUserEntityToLoginData(result);
        emit(AuthSuccess(result));
      });
    });
  }
}
