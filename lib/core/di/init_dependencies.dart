import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:every_watch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:every_watch/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  _initAuth();
}

void _initAuth() {
  serviceLocator
      .registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<UserSignupUsecase>(
    () => UserSignupUsecase(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignupUsecase: serviceLocator(),
    ),
  );
}
