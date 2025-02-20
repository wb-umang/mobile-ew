import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/network/api_client.dart';
import 'package:every_watch/core/network/api_endpoints.dart';
import 'package:every_watch/core/storage/secure_storage.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(ApiEndpoints.login, data: {
        "username": email,
        "password": password,
      });

      print("response: ${response.data.data}");

      final user = UserModel.fromJson(response.data.data);

      // Save access token securely
      await SecureStorage.saveToken(user.accessToken);

      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String invitationCode,
  }) async {
    try {
      final response = await apiClient.post(ApiEndpoints.register, data: {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "invitationCode": invitationCode,
      });

      final user = UserModel.fromJson(response.data);

      // Save access token securely
      await SecureStorage.saveToken(user.accessToken);

      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
