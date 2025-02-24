// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: (json['userId'] as num).toInt(),
      email: json['email'] as String,
      userName: json['userName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      accessToken: json['accessToken'] as String,
      accessTokenExpires: (json['accessTokenExpires'] as num).toInt(),
      refreshToken: json['refreshToken'] as String,
      id: (json['id'] as num).toInt(),
      rememberMe: json['rememberMe'] as bool,
      isLogin: json['isLogin'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      subscriptionTypeId: (json['subscriptionTypeId'] as num).toInt(),
      subscriptionName: json['subscriptionName'] as String,
      currencyName: json['currencyName'] as String,
      tableauEmail: json['tableauEmail'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'accessToken': instance.accessToken,
      'accessTokenExpires': instance.accessTokenExpires,
      'refreshToken': instance.refreshToken,
      'id': instance.id,
      'rememberMe': instance.rememberMe,
      'isLogin': instance.isLogin,
      'isEmailVerified': instance.isEmailVerified,
      'subscriptionTypeId': instance.subscriptionTypeId,
      'subscriptionName': instance.subscriptionName,
      'currencyName': instance.currencyName,
      'tableauEmail': instance.tableauEmail,
      'roles': instance.roles,
    };
