import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/core/common/entities/user.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      try {
        final result = await authRemoteDataSource.logInWithEmailAndPassword(
            email: email, password: password);
        return right(result);
      } on ServerException catch (e) {
        return left(Failure(e.message));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final result = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, name: name, password: password);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
