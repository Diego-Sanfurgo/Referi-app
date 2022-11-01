import 'package:referi_app/controllers/alert_controller.dart';

import '../API/users/patch_user.dart';
import '../controllers/navigation_controller.dart';

abstract class UserHandler {
  static updateUser() async {
    Alert.showLoading();
    bool requestOK = await patchUser();
    if (!requestOK) {
      Alert.showError(
          "Ocurrió un error al intentar actualizar los datos. Intenta en unos segundos.");
      NavigationController.pop();
      return;
    }

    Alert.showToast("¡Editaste tus datos personales!");
    NavigationController.goTo(Routes.personalData, popPage: true);
  }
}
