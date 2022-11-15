import 'package:dio/dio.dart';

import '../../API/params.dart';
import '../../models/enrollment.dart';
import '../../providers/app_providers.dart';

Future<List<Enrollment>> getUserEnrollments() async {
  Dio dio = Dio();
  String userId = AppProviders.userProviderDeaf.currentUser!.id;

  List<Enrollment> list = [];

  return await dio
      .get(AssociatesUrls.getEnrollmentsByUserId + userId,
          options: Options(headers: getUserToken()))
      .then((value) {
        for (var activity in value.data['data']) {
          list.add(Enrollment.fromJson(activity));
        }
        return list;
      })
      .onError((error, stackTrace) {
        return list;
      })
      .timeout(
        const Duration(seconds: 40),
        onTimeout: () => list,
      );
}
