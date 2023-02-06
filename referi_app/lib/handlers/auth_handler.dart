import '/API/auth/post_verify.dart';
import '/models/user_register.dart';
import '/providers/app_providers.dart';
import '/API/auth/post_auth_login.dart';

import '../API/auth/post_auth_register.dart';
import '../controllers/general_alert_controller.dart';
import '../controllers/navigation_controller.dart';

class AuthHandler {
  static Future<bool> registerUser() async {
    UserRegister newUser = AppProviders.userProviderDeaf.userRegisterModel;

    GeneralAlert.showLoading();
    bool? isRegistered = await postAuthRegister(newUser);
    NavigationController.pop();

    if (!isRegistered) {
      GeneralAlert.showError(
          "Ocurrió un error al enviar el código al correo electrónico. Intenta nuevamente.");
      return false;
    }
    return isRegistered;
  }

  static postAuthRecover() async {}

  static Future<bool> postLogin(String email, String password) async {
    GeneralAlert.showLoading();
    bool isOk = await postAuthLogin(email, password);
    NavigationController.pop();

    if (!isOk) {
      GeneralAlert.showToast("Usuario o contraseña incorrectos");
      return false;
    }
    return true;
  }

  static Future<bool> verifyUser(String code) async {
    GeneralAlert.showLoading();
    bool isOK = await postVerify(code);
    NavigationController.pop();

    if (!isOK) {
      GeneralAlert.showError(
          "Ocurrió un error al validar el código. Intenta de nuevo.");
      return false;
    }

    return true;
  }
}
