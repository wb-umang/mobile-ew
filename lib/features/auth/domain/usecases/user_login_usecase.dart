import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginUsecase implements Usecase<UserEntity, UserLoginParams> {
  final AuthRepository authRepository;

  UserLoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserLoginParams params) async {
    return await authRepository.logInWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  const UserLoginParams({
    required this.email,
    required this.password,
  });
}
