import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignupUsecase implements Usecase<UserEntity, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignupUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
        email: params.email,
        firstName: params.firstName,
        lastName: params.lastName,
        password: params.password,
        invitationCode: params.invitationCode);
  }
}

class UserSignUpParams {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String invitationCode;

  const UserSignUpParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.invitationCode,
  });
}
