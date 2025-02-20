import 'package:json_annotation/json_annotation.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  UserModel({
    int? userId,
    String? email,
    String? userName,
    String? firstName,
    super.middleName,
    String? lastName,
    String? accessToken,
    int? accessTokenExpires,
    String? refreshToken,
    int? id,
    bool? rememberMe,
    bool? isLogin,
    bool? isEmailVerified,
    int? subscriptionTypeId,
    String? subscriptionName,
    String? currencyName,
    String? tableauEmail,
    List<String>? roles,
  }) : super(
          userId: userId ?? 0, // Default values
          email: email ?? "",
          userName: userName ?? "",
          firstName: firstName ?? "",
          lastName: lastName ?? "",
          accessToken: accessToken ?? "",
          accessTokenExpires: accessTokenExpires ?? 0,
          refreshToken: refreshToken ?? "",
          id: id ?? 0,
          rememberMe: rememberMe ?? false,
          isLogin: isLogin ?? false,
          isEmailVerified: isEmailVerified ?? false,
          subscriptionTypeId: subscriptionTypeId ?? 0,
          subscriptionName: subscriptionName ?? "",
          currencyName: currencyName ?? "",
          tableauEmail: tableauEmail ?? "",
          roles: roles ?? [],
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
