import 'package:provider/provider.dart';
import 'package:referi_app/API/auth/post_auth_login.dart';
import 'package:referi_app/utils/utils.dart' as util;

import '../API/auth/post_auth_register.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AuthHandler {
  static Future<bool> registerUser() async {
    User newUser = Provider.of<UserProvider>(util.actualContext, listen: false)
        .userRegisterModel;
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
