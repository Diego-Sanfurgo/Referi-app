import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/activity.dart';
import 'package:referi_app/providers/app_providers.dart';

Future<List<Activity>> getUseractivities() async {
  Dio dio = Dio();
  String userId = AppProviders.userProviderDeaf.currentUser!.id;

  List<Activity> list = [];

  return await dio
      .get(AssociatesUrls.getActivitiesByUserId + userId,
          options: Options(headers: getUserToken()))
      .then((value) {
        for (var activity in value.data['data']) {
          list.add(Activity.fromJson(activity));
        }
        return list;
      })
      .onError((error, stackTrace) => list)
      .timeout(
        const Duration(seconds: 40),
        onTimeout: () => list,
      );
}
