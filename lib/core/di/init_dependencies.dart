import 'dart:io';

import 'package:every_watch/core/network/api_client.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:every_watch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:every_watch/features/auth/domain/usecases/sign_in_with_apple_usecase.dart';
import 'package:every_watch/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:every_watch/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:every_watch/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:every_watch/features/home/data/datasources/home_remote_data_source.dart';
import 'package:every_watch/features/home/data/datasources/home_remote_data_source_impl.dart';
import 'package:every_watch/features/home/data/repositories/home_repository_impl.dart';
import 'package:every_watch/features/home/domain/repository/home_reposity.dart';
import 'package:every_watch/features/home/domain/usecases/watch_listing_usecase.dart';
import 'package:every_watch/features/home/ui/bloc/home_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  // Core
  serviceLocator.registerLazySingleton(() => ApiClient());

  serviceLocator.registerLazySingleton(() => GoogleSignIn(
        scopes: [
          'email',
          'openid',
          'profile',
        ],
        serverClientId: Platform.isAndroid
            ? dotenv.env['WEB_GOOGLE_CLIENT_ID']
            : dotenv.env['IOS_GOOGLE_CLIENT_ID'],
      ));

  // Auth Module
  _initAuth();

  // Home Module
  _initHome();
}

void _initAuth() {
  serviceLocator
      .registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
            apiClient: serviceLocator(),
            googleSignIn: serviceLocator(),
          ));

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<UserSignupUsecase>(
    () => UserSignupUsecase(serviceLocator()),
  );

  serviceLocator.registerFactory<UserLoginUsecase>(
    () => UserLoginUsecase(serviceLocator()),
  );

  serviceLocator.registerFactory<SignInWithGoogleUsecase>(
    () => SignInWithGoogleUsecase(serviceLocator()),
  );

  serviceLocator.registerFactory<SignInWithAppleUsecase>(
    () => SignInWithAppleUsecase(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignupUsecase: serviceLocator(),
      userLoginUsecase: serviceLocator(),
      signInWithGoogleUsecase: serviceLocator(),
      signInWithAppleUsecase: serviceLocator(),
    ),
  );
}

void _initHome() {
  serviceLocator
      .registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(
            apiClient: serviceLocator(),
          ));

  serviceLocator.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<WatchListingUsecase>(
    () => WatchListingUsecase(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      watchListingUsecase: serviceLocator(),
    ),
  );
}
