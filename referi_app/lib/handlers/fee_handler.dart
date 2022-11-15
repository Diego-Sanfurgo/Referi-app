import 'package:referi_app/API/activity/get_activities_by_type.dart';
import 'package:referi_app/API/fees/get_activity_fees.dart';

import '../models/activity_fee.dart';
import '../views/activities/activity_detail_enrolled.dart';

abstract class FeeHandler {
  static Future<List<ActivityFee>?> obtainActivityFees(
      String activityId) async {
    return await getActivityFees(activityId);
  }
}
