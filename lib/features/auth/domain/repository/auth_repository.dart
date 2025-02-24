import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String invitationCode,
  });
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithApple();
}
