import 'package:every_watch/core/error/failures.dart';
import 'package:every_watch/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';

class UserSignupUsecase implements Usecase<String, UserSignUpParams> {
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) {
    // TODO: implement call
    throw UnimplementedError();
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
