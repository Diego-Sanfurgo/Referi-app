import 'package:referi_app/API/auth/post_verify.dart';

import '../../models/user_register.dart';
import '../../providers/app_providers.dart';
import '../../API/auth/post_auth_login.dart';

import '../API/auth/post_auth_register.dart';
import '../controllers/alert_controller.dart';
import '../controllers/navigation_controller.dart';

class AuthHandler {
  static Future<bool> registerUser() async {
    UserRegister newUser = AppProviders.userProviderDeaf.userRegisterModel;

    Alert.showLoading();
    bool? isRegistered = await postAuthRegister(newUser);
    NavigationController.pop();

    if (!isRegistered) {
      Alert.showError(
          "Ocurrió un error al enviar el código al correo electrónico. Intenta nuevamente.");
      return false;
    }
    return isRegistered;
  }

  static postAuthRecover() async {}
  static Future<bool> postLogin(String email, String password) async {
    Alert.showLoading();
    bool isOk = await postAuthLogin(email, password);
    NavigationController.pop();
    if (!isOk) {
      Alert.showToast("Usuario o contraseña incorrectos");
      return false;
    }
    return true;
  }

  static verifyUser(String code) async {
    await postVerify(code);
  }
}
