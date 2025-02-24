import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDataSource.logInWithEmailAndPassword(
          email: email, password: password);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String invitationCode,
  }) async {
    try {
      final result = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email,
          firstName: firstName,
          lastName: lastName,
          password: password,
          invitationCode: invitationCode);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final result = await authRemoteDataSource.signInWithGoogle();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
