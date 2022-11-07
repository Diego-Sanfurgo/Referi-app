import 'package:dio/dio.dart';

import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/grid_activity.dart';

Future<bool> getActivityTypes() async {
  Dio dio = Dio();

  return await dio.get(ActivityUrls.getActivities).then((value) {
    for (var activity in value.data['data']) {
      // AppProviders.activityProviderDeaf
      //     .addActivityToGridActivityList(GridActivity.fromJson(activity));
      if (activity['name'] != "Hockey") {
        gridActivities.add(GridActivity.fromJson(activity));
      }
    }

    return true;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 40), onTimeout: () => false);
}
