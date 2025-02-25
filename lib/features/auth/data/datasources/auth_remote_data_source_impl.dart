import 'package:dio/dio.dart';
import 'package:every_watch/core/error/exceptions.dart';
import 'package:every_watch/core/network/api_client.dart';
import 'package:every_watch/core/network/api_endpoints.dart';
import 'package:every_watch/core/network/api_response.dart';
import 'package:every_watch/core/storage/secure_storage.dart';
import 'package:every_watch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:every_watch/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.apiClient,
    required this.googleSignIn,
  });

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

      final result = ApiResponse.fromJson(response.data);

      if (result.success) {
        final user = UserModel.fromJson(result.data);

        // Save access token securely
        await SecureStorage.saveData("access_token", user.accessToken);
        await SecureStorage.saveData(
            "token_expiry", user.accessTokenExpires.toString());
        await SecureStorage.saveData("refresh_token", user.refreshToken);

        return user;
      } else {
        throw ServerException(result.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(e.response!.data['message'] ?? "Request failed");
      } else {
        throw ServerException(e.message ?? "Unexpected error");
      }
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

      final result = ApiResponse.fromJson(response.data);

      if (result.success) {
        final user = UserModel.fromJson(result.data);

        // Save access token securely
        await SecureStorage.saveData("access_token", user.accessToken);
        await SecureStorage.saveData(
            "token_expiry", user.accessTokenExpires.toString());
        await SecureStorage.saveData("refresh_token", user.refreshToken);

        return user;
      } else {
        throw ServerException(result.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(e.response!.data['message'] ?? "Request failed");
      } else {
        throw ServerException(e.message ?? "Unexpected error");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) {
        throw ServerException("Google sign-in flow cancelled.");
      }

      final GoogleSignInAuthentication auth = await account.authentication;
      String? idToken = auth.idToken;

      final response = await apiClient.post(ApiEndpoints.googleLogin, data: {
        "idToken": idToken,
      });

      final result = ApiResponse.fromJson(response.data);

      if (result.success) {
        final user = UserModel.fromJson(result.data);

        // Save access token securely
        await SecureStorage.saveData("access_token", user.accessToken);
        await SecureStorage.saveData(
            "token_expiry", user.accessTokenExpires.toString());
        await SecureStorage.saveData("refresh_token", user.refreshToken);

        return user;
      } else {
        throw ServerException(result.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(e.response!.data['message'] ?? "Request failed");
      } else {
        throw ServerException(e.message ?? "Unexpected error");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  @override
  Future<UserModel> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Note: Apple provides email and full name only during the very first login.
      String displayName = '';
      if (credential.givenName != null && credential.familyName != null) {
        displayName = '${credential.givenName} ${credential.familyName}';
      }

      final response = await apiClient.post(ApiEndpoints.googleLogin, data: {
        "idToken": 'idToken',
      });

      final result = ApiResponse.fromJson(response.data);

      if (result.success) {
        final user = UserModel.fromJson(result.data);

        // Save access token securely
        await SecureStorage.saveData("access_token", user.accessToken);
        await SecureStorage.saveData(
            "token_expiry", user.accessTokenExpires.toString());
        await SecureStorage.saveData("refresh_token", user.refreshToken);

        return user;
      } else {
        throw ServerException(result.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(e.response!.data['message'] ?? "Request failed");
      } else {
        throw ServerException(e.message ?? "Unexpected error");
      }
    } catch (e) {
      throw ServerException("Apple sign in failed. ${e.toString()}");
    }
  }
}
