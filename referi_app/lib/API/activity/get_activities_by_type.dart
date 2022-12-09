import 'package:dio/dio.dart';

import '/API/params.dart';
import '/models/dto/activity_dto.dart';

Future<List<DTOActivity>?> getActivitiesByType(String activityId) async {
  Dio dio = Dio();

  return await dio
      .get(ActivityUrls.getActivityTypeById + activityId,
          options: Options(headers: getUserToken()))
      .then((value) {
    var list = value.data['data'] as List;
    if (list.isEmpty) {
      return null;
    }
    // List<Activity> activityList = [];

    // for (var activity in value.data['data']) {
    //   activityList.add(Activity.fromJson(activity));
    // }
    List<DTOActivity> activityList = [];

    for (var activity in value.data['data']) {
      if (activity['tarifas'] == null) {
        continue;
      }
      activityList.add(DTOActivity.fromJson(activity));
    }
    return activityList;
  }).onError((error, stackTrace) {
    return null;
  }).timeout(
    const Duration(seconds: 40),
    onTimeout: () => null,
  );
}
