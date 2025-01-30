// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginDataStruct extends BaseStruct {
  LoginDataStruct({
    int? userId,
    String? email,
    String? userName,
    String? firstName,
    String? middleName,
    String? lastName,
    String? accessToken,
    String? refreshToken,
    int? id,
    bool? rememberMe,
    bool? isLogin,
    bool? isEmailVerified,
    int? subscriptionTypeId,
    String? subscriptionName,
    String? currencyName,
    String? tableauEmail,
    String? roles,
  })  : _userId = userId,
        _email = email,
        _userName = userName,
        _firstName = firstName,
        _middleName = middleName,
        _lastName = lastName,
        _accessToken = accessToken,
        _refreshToken = refreshToken,
        _id = id,
        _rememberMe = rememberMe,
        _isLogin = isLogin,
        _isEmailVerified = isEmailVerified,
        _subscriptionTypeId = subscriptionTypeId,
        _subscriptionName = subscriptionName,
        _currencyName = currencyName,
        _tableauEmail = tableauEmail,
        _roles = roles;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "middleName" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  set middleName(String? val) => _middleName = val;

  bool hasMiddleName() => _middleName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refreshToken" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "rememberMe" field.
  bool? _rememberMe;
  bool get rememberMe => _rememberMe ?? false;
  set rememberMe(bool? val) => _rememberMe = val;

  bool hasRememberMe() => _rememberMe != null;

  // "isLogin" field.
  bool? _isLogin;
  bool get isLogin => _isLogin ?? false;
  set isLogin(bool? val) => _isLogin = val;

  bool hasIsLogin() => _isLogin != null;

  // "isEmailVerified" field.
  bool? _isEmailVerified;
  bool get isEmailVerified => _isEmailVerified ?? false;
  set isEmailVerified(bool? val) => _isEmailVerified = val;

  bool hasIsEmailVerified() => _isEmailVerified != null;

  // "subscriptionTypeId" field.
  int? _subscriptionTypeId;
  int get subscriptionTypeId => _subscriptionTypeId ?? 0;
  set subscriptionTypeId(int? val) => _subscriptionTypeId = val;

  void incrementSubscriptionTypeId(int amount) =>
      subscriptionTypeId = subscriptionTypeId + amount;

  bool hasSubscriptionTypeId() => _subscriptionTypeId != null;

  // "subscriptionName" field.
  String? _subscriptionName;
  String get subscriptionName => _subscriptionName ?? '';
  set subscriptionName(String? val) => _subscriptionName = val;

  bool hasSubscriptionName() => _subscriptionName != null;

  // "currencyName" field.
  String? _currencyName;
  String get currencyName => _currencyName ?? '';
  set currencyName(String? val) => _currencyName = val;

  bool hasCurrencyName() => _currencyName != null;

  // "tableauEmail" field.
  String? _tableauEmail;
  String get tableauEmail => _tableauEmail ?? '';
  set tableauEmail(String? val) => _tableauEmail = val;

  bool hasTableauEmail() => _tableauEmail != null;

  // "roles" field.
  String? _roles;
  String get roles => _roles ?? '';
  set roles(String? val) => _roles = val;

  bool hasRoles() => _roles != null;

  static LoginDataStruct fromMap(Map<String, dynamic> data) => LoginDataStruct(
        userId: castToType<int>(data['userId']),
        email: data['email'] as String?,
        userName: data['userName'] as String?,
        firstName: data['firstName'] as String?,
        middleName: data['middleName'] as String?,
        lastName: data['lastName'] as String?,
        accessToken: data['accessToken'] as String?,
        refreshToken: data['refreshToken'] as String?,
        id: castToType<int>(data['id']),
        rememberMe: data['rememberMe'] as bool?,
        isLogin: data['isLogin'] as bool?,
        isEmailVerified: data['isEmailVerified'] as bool?,
        subscriptionTypeId: castToType<int>(data['subscriptionTypeId']),
        subscriptionName: data['subscriptionName'] as String?,
        currencyName: data['currencyName'] as String?,
        tableauEmail: data['tableauEmail'] as String?,
        roles: data['roles'] as String?,
      );

  static LoginDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'email': _email,
        'userName': _userName,
        'firstName': _firstName,
        'middleName': _middleName,
        'lastName': _lastName,
        'accessToken': _accessToken,
        'refreshToken': _refreshToken,
        'id': _id,
        'rememberMe': _rememberMe,
        'isLogin': _isLogin,
        'isEmailVerified': _isEmailVerified,
        'subscriptionTypeId': _subscriptionTypeId,
        'subscriptionName': _subscriptionName,
        'currencyName': _currencyName,
        'tableauEmail': _tableauEmail,
        'roles': _roles,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'middleName': serializeParam(
          _middleName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'accessToken': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refreshToken': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'rememberMe': serializeParam(
          _rememberMe,
          ParamType.bool,
        ),
        'isLogin': serializeParam(
          _isLogin,
          ParamType.bool,
        ),
        'isEmailVerified': serializeParam(
          _isEmailVerified,
          ParamType.bool,
        ),
        'subscriptionTypeId': serializeParam(
          _subscriptionTypeId,
          ParamType.int,
        ),
        'subscriptionName': serializeParam(
          _subscriptionName,
          ParamType.String,
        ),
        'currencyName': serializeParam(
          _currencyName,
          ParamType.String,
        ),
        'tableauEmail': serializeParam(
          _tableauEmail,
          ParamType.String,
        ),
        'roles': serializeParam(
          _roles,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginDataStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        middleName: deserializeParam(
          data['middleName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        accessToken: deserializeParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refreshToken'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        rememberMe: deserializeParam(
          data['rememberMe'],
          ParamType.bool,
          false,
        ),
        isLogin: deserializeParam(
          data['isLogin'],
          ParamType.bool,
          false,
        ),
        isEmailVerified: deserializeParam(
          data['isEmailVerified'],
          ParamType.bool,
          false,
        ),
        subscriptionTypeId: deserializeParam(
          data['subscriptionTypeId'],
          ParamType.int,
          false,
        ),
        subscriptionName: deserializeParam(
          data['subscriptionName'],
          ParamType.String,
          false,
        ),
        currencyName: deserializeParam(
          data['currencyName'],
          ParamType.String,
          false,
        ),
        tableauEmail: deserializeParam(
          data['tableauEmail'],
          ParamType.String,
          false,
        ),
        roles: deserializeParam(
          data['roles'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginDataStruct &&
        userId == other.userId &&
        email == other.email &&
        userName == other.userName &&
        firstName == other.firstName &&
        middleName == other.middleName &&
        lastName == other.lastName &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        id == other.id &&
        rememberMe == other.rememberMe &&
        isLogin == other.isLogin &&
        isEmailVerified == other.isEmailVerified &&
        subscriptionTypeId == other.subscriptionTypeId &&
        subscriptionName == other.subscriptionName &&
        currencyName == other.currencyName &&
        tableauEmail == other.tableauEmail &&
        roles == other.roles;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        email,
        userName,
        firstName,
        middleName,
        lastName,
        accessToken,
        refreshToken,
        id,
        rememberMe,
        isLogin,
        isEmailVerified,
        subscriptionTypeId,
        subscriptionName,
        currencyName,
        tableauEmail,
        roles
      ]);
}

LoginDataStruct createLoginDataStruct({
  int? userId,
  String? email,
  String? userName,
  String? firstName,
  String? middleName,
  String? lastName,
  String? accessToken,
  String? refreshToken,
  int? id,
  bool? rememberMe,
  bool? isLogin,
  bool? isEmailVerified,
  int? subscriptionTypeId,
  String? subscriptionName,
  String? currencyName,
  String? tableauEmail,
  String? roles,
}) =>
    LoginDataStruct(
      userId: userId,
      email: email,
      userName: userName,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      accessToken: accessToken,
      refreshToken: refreshToken,
      id: id,
      rememberMe: rememberMe,
      isLogin: isLogin,
      isEmailVerified: isEmailVerified,
      subscriptionTypeId: subscriptionTypeId,
      subscriptionName: subscriptionName,
      currencyName: currencyName,
      tableauEmail: tableauEmail,
      roles: roles,
    );
