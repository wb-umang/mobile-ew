import 'package:every_watch/backend/schema/structs/login_data_struct.dart';
import 'package:every_watch/core/common/entities/user_entity.dart';

LoginDataStruct mapUserEntityToLoginData(UserEntity userEntity) {
  return LoginDataStruct(
    userId: userEntity.userId,
    email: userEntity.email,
    userName: userEntity.userName,
    firstName: userEntity.firstName,
    middleName: userEntity.middleName,
    lastName: userEntity.lastName,
    accessToken: userEntity.accessToken,
    refreshToken: userEntity.refreshToken,
    id: userEntity.id,
    rememberMe: userEntity.rememberMe,
    isLogin: userEntity.isLogin,
    isEmailVerified: userEntity.isEmailVerified,
    subscriptionTypeId: userEntity.subscriptionTypeId,
    subscriptionName: userEntity.subscriptionName,
    currencyName: userEntity.currencyName,
    tableauEmail: userEntity.tableauEmail,
    roles: userEntity.roles?.join(','), // Convert List<String> to String
  );
}
