import 'package:referi_app/API/activity/get_activity_type.dart';

abstract class ActivityHandler {
  static Future<bool> obtainActivityTypes() async {
    return await getActivityTypes();
  }
}
