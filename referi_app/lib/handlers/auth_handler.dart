import '../../models/user_register.dart';
import '../../providers/app_providers.dart';
import '../../API/auth/post_auth_login.dart';

import '../API/auth/post_auth_register.dart';

class AuthHandler {
  static Future<bool> registerUser() async {
    UserRegister newUser = AppProviders.userProviderDeaf.userRegisterModel;
    bool? isRegistered = await postAuthRegister(newUser);
    if (isRegistered == null) {
      return false;
    }
    return isRegistered;
  }

  static postAuthRecover() async {}
  static Future<bool> postLogin(String email, String password) async =>
      await postAuthLogin(email, password);
}
