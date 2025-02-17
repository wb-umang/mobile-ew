import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupDependencies() {
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
}
