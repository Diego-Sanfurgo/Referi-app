import 'package:referi_app/handlers/activity_handler.dart';

abstract class ActivityController {
  static Future<bool> obtainActivityTypes() async {
    return await ActivityHandler.obtainActivityTypes();
  }
}
