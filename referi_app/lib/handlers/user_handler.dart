import 'package:referi_app/API/associates/get_user_activities.dart';
import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/models/activity.dart';

import '../API/users/patch_user.dart';
import '../controllers/navigation_controller.dart';

abstract class UserHandler {
  static Future<bool> updateUser() async {
    Alert.showLoading();
    bool requestOK = await patchUser();
    NavigationController.pop();

    if (!requestOK) {
      Alert.showError(
          "Ocurrió un error al intentar actualizar los datos. Intenta en unos segundos.");
      return false;
    }

    Alert.showToast("¡Editaste tus datos personales!");
    return true;
  }

  static Future<List<Activity>> obtainerUserActivities() async {
    List<Activity> list = await getUseractivities();

    return list;
  }
}
