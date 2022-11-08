import 'package:dio/dio.dart';

import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/grid_activity.dart';

Future<List<GridActivity>> getActivityTypes() async {
  Dio dio = Dio();
  List<GridActivity> activities = gridActivities;

  return await dio.get(ActivityUrls.getActivities).then((value) {
    for (var activity in value.data['data']) {
      if (activities.length < 11 && activity['tipo'] != "Hockey") {
        activities.insert(0, GridActivity.fromJson(activity));
      }
    }

    return activities;
  }).onError((error, stackTrace) {
    return activities;
  }).timeout(const Duration(seconds: 40), onTimeout: () => activities);
}
