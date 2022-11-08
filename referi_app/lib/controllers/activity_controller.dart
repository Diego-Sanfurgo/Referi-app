import 'package:referi_app/handlers/activity_handler.dart';
import 'package:referi_app/models/grid_activity.dart';

import '../models/activity.dart';

abstract class ActivityController {
  static Future<List<GridActivity>> obtainActivityTypes() async {
    return await ActivityHandler.obtainActivityTypes();
  }

  static Future<List<Activity>?> obtainActivitiesByType(
      String activityId) async {
    return await ActivityHandler.obtainActivitiesByType(activityId);
  }
}
