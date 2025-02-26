import 'package:every_watch/core/common/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.email,
    required super.userName,
    required super.firstName,
    super.middleName,
    required super.lastName,
    required super.accessToken,
    required super.accessTokenExpires,
    required super.refreshToken,
    required super.id,
    required super.rememberMe,
    required super.isLogin,
    required super.isEmailVerified,
    required super.subscriptionTypeId,
    required super.subscriptionName,
    required super.currencyName,
    super.tableauEmail,
    super.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
