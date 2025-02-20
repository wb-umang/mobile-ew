import 'package:every_watch/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String invitationCode,
  });
}
