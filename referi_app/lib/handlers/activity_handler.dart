import 'package:referi_app/API/activity/get_activities_by_type.dart';
import 'package:referi_app/API/activity/get_activity_type.dart';
import 'package:referi_app/API/activity/get_turno.dart';
import 'package:referi_app/models/activity.dart';
import 'package:referi_app/models/grid_activity.dart';
import 'package:referi_app/models/turno.dart';

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
}
