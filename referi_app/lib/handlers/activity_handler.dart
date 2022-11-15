import 'package:referi_app/controllers/navigation_controller.dart';

import '../../models/turno.dart';
import '../../models/activity.dart';
import '../../models/grid_activity.dart';
import '../../API/activity/get_turno.dart';
import '../../controllers/alert_controller.dart';
import '../../API/activity/get_activity_type.dart';
import '../../API/activity/get_activities_by_type.dart';
import '../../API/activity/post_inscribir_actividad.dart';

abstract class ActivityHandler {
  static Future<List<GridActivity>> obtainActivityTypes() async {
    return await getActivityTypes();
  }

  static Future<List<Activity>?> obtainActivitiesByType(
      String activityId) async {
    return await getActivitiesByType(activityId);
  }

  static Future<Turno?> obtainShift(String shiftId) async {
    return await getTurno(shiftId);
  }

  static Future<bool> enrollToActivity() async {
    Alert.showLoading();
    bool isOk = await postInscribirActividad();
    NavigationController.pop();
    if (!isOk) {
      Alert.showError(
          "Ocurrió un error al inscribirte en la actividad. Intenta de nuevo.");
      return false;
    }
    return true;
  }
}
