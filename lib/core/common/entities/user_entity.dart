class UserEntity {
  final int userId;
  final String email;
  final String userName;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String accessToken;
  final int accessTokenExpires;
  final String refreshToken;
  final int id;
  final bool rememberMe;
  final bool isLogin;
  final bool isEmailVerified;
  final int subscriptionTypeId;
  final String subscriptionName;
  final String currencyName;
  final String tableauEmail;
  final List<String>? roles;

  const UserEntity({
    required this.userId,
    required this.email,
    required this.userName,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.accessToken,
    required this.accessTokenExpires,
    required this.refreshToken,
    required this.id,
    required this.rememberMe,
    required this.isLogin,
    required this.isEmailVerified,
    required this.subscriptionTypeId,
    required this.subscriptionName,
    required this.currencyName,
    required this.tableauEmail,
    this.roles,
  });
}
