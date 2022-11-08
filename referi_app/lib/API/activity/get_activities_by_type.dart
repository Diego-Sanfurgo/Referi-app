import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/activity.dart';

Future<List<Activity>?> getActivitiesByType(String activityId) async {
  Dio dio = Dio();

  return await dio
      .get(ActivityUrls.getActivityById + activityId,
          options: Options(headers: getUserToken()))
      .then((value) {
    var list = value.data['data'] as List;
    if (list.isEmpty) {
      return null;
    }
    List<Activity> activityList = [];

    for (var activity in value.data['data']) {
      // activityList.add(Activity.fromJson(activity));
      print(activityId);
    }
    return activityList;
  }).onError((error, stackTrace) {
    return null;
  }).timeout(
    const Duration(seconds: 40),
    onTimeout: () => null,
  );
}
