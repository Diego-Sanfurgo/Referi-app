import 'package:dio/dio.dart';

import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/activity_type.dart';

Future<List<ActivityType>> getActivityTypes() async {
  Dio dio = Dio();
  List<ActivityType> activities = [];

  return await dio.get(ActivityUrls.getActivities).then((value) {
    for (var activity in value.data['data']) {
      activities.insert(0, ActivityType.fromJson(activity));
      // if (activities.length <= 11 && activity['tipo'] != "Hockey") {
      //   activities.insert(0, ActivityType.fromJson(activity));
      // }
    }

    return activities;
  }).onError((error, stackTrace) {
    return activities;
  }).timeout(const Duration(seconds: 40), onTimeout: () => activities);
}
