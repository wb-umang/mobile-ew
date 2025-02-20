import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:every_watch/core/common/entities/user.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignupUsecase implements Usecase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignupUsecase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
        email: params.email, name: params.name, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String name;
  final String password;

  const UserSignUpParams({
    required this.email,
    required this.name,
    required this.password,
  });
}
