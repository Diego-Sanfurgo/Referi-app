import 'package:referi_app/handlers/fee_handler.dart';

import '../models/activity_fee.dart';

abstract class FeeController {
  static Future<List<ActivityFee>?> getActivityFees(String activityId) async {
    return await FeeHandler.obtainActivityFees(activityId);
  }
}
