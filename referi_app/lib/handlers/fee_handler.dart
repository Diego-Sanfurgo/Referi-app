import '/models/activity_fee.dart';
import '/API/fees/get_activity_fees.dart';

abstract class FeeHandler {
  static Future<List<ActivityFee>?> obtainActivityFees(
      String activityId) async {
    return await getActivityFees(activityId);
  }
}
