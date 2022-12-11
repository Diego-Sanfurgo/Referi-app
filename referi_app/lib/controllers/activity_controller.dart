import 'package:referi_app/models/dto/activity_dto.dart';

import '../models/turno.dart';
import '../models/activity.dart';
import '../models/activity_type.dart';
import '../models/activity_fee_payment.dart';

import '../providers/app_providers.dart';
import '../handlers/activity_handler.dart';
import '../controllers/alert_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/navigation_controller.dart';

abstract class ActivityController {
  static Future<List<ActivityType>> obtainActivityTypes() async {
    return await ActivityHandler.obtainActivityTypes();
  }

  static Future<Activity> obtainActivityById(String activityId) async {
    return await ActivityHandler.fetchActivityById(activityId);
  }

  static Future<Turno?> obtainShift(String shiftId) async =>
      await ActivityHandler.obtainShift(shiftId);

  static enrollToActivity(DTOActivity activity) async {
    return await ActivityHandler.enrollToActivity();
  }

  static enrollAndPayActivity(DTOActivity activity) async {
    bool isEnrolled = await enrollToActivity(activity);
    if (!isEnrolled) return;

    List<ActivityFeePayment> feeList = await PaymentController.getUserFees();
    List<String> feesId = [feeList.first.id];

    bool isPayed = await PaymentController.payActivity(feesId);
    if (!isPayed) {
      Alert.showError(
          "Ocurrió un error al intentar pagar la cuota. Intenta nuevamente");
      return;
    }
    NavigationController.goTo(Routes.successView, popPage: true);
  }

  static reservePlace(DTOActivity activity) async {
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
