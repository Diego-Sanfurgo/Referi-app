import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

import '../../models/activity_fee.dart';

Future<List<ActivityFee>?> getActivityFees(String activityId) async {
  Dio dio = Dio();

  List<ActivityFee> list = [];

  return await dio
      .get(
    FeeUrls.getFeesByactivityId + activityId,
    options: Options(headers: getUserToken()),
  )
      .then((value) {
    for (var fee in value.data['data']) {
      list.add(ActivityFee.fromJson(fee));
    }
    return list;
  }).onError((error, stackTrace) {
    return list;
  }).timeout(const Duration(seconds: 40), onTimeout: () => list);
}
