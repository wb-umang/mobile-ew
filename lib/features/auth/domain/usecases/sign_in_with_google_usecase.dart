import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:every_watch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignInWithGoogleUsecase implements Usecase<UserEntity, void> {
  final AuthRepository authRepository;

  SignInWithGoogleUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(void params) async {
    return await authRepository.signInWithGoogle();
  }
}
