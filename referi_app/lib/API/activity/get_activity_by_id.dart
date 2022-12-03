import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/activity.dart';

Future<Activity> getActivityById(String activityId) async {
  Dio dio = Dio();

  return await dio
      .get(ActivityUrls.getActivityById + activityId,
          options: Options(headers: getUserToken()))
      .then((value) {
    return Activity.fromJson(value.data);
  });
  // .onError((error, stackTrace) {})
  // .timeout(
  //   const Duration(seconds: 40),
  //   onTimeout: () => null,
  // );
}
