import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/models/user_register.dart';

import '../API/users/patch_user.dart';
import '../controllers/navigation_controller.dart';

abstract class UserHandler {
  static updateUser(UserRegister user) async {
    Alert.showLoading();
    await patchUser(user);
    NavigationController.pop();
  }
}
