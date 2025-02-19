import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: implement logInWithEmailAndPassword
      return "";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      // TODO: implement signUpWithEmailAndPassword
      return "";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
