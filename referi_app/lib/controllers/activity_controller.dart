import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/controllers/payment_controller.dart';
import 'package:referi_app/handlers/activity_handler.dart';
import 'package:referi_app/models/grid_activity.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../models/activity.dart';
import '../models/turno.dart';

abstract class ActivityController {
  static Future<List<GridActivity>> obtainActivityTypes() async {
    return await ActivityHandler.obtainActivityTypes();
  }

  static Future<List<Activity>?> obtainActivitiesByType(
      String activityId) async {
    return await ActivityHandler.obtainActivitiesByType(activityId);
  }

  static Future<Turno?> obtainShift(String shiftId) async =>
      await ActivityHandler.obtainShift(shiftId);

  static enrollToActivity(Activity activity) async {
    await ActivityHandler.enrollToActivity();
    await PaymentController.payActivity();
  }

  static reservePlace(Activity activity) async {
    await Alert.showReservePlaceMessage(activity);
  }

  static addTimeRange(String id, String label, bool value) {
    if (value) {
      AppProviders.activityProviderDeaf.addTimeRange(id, label);
      return;
    }
    AppProviders.activityProviderDeaf.deleteTimeRange(id);
  }

  static clearTimeRange() =>
      AppProviders.activityProviderDeaf.clearTimeRanges();
}
