import 'package:every_watch/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  });
}
