import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/dto/activity_dto.dart';

Future<List<DTOActivity>?> getActivityiesByOrg(String orgId) async {
  Dio dio = Dio();
  String url = ActivityUrls.getActivitiesByOrg + orgId;

// late final List<DTOActivity> list;
//   try {
//     var response = await dio
//       .get(url, options: Options(headers: getUserToken()));

//       response.data["data"];
//   } catch (e) {
//     Alert.showError("Ocurrió un problema al buscar las actividades de la organización");
//   }

  return await dio
      .get(url, options: Options(headers: getUserToken()))
      .then((value) {
    var list = value.data['data'] as List;
    if (list.isEmpty) {
      return null;
    }
    List<DTOActivity> activityList = [];

    for (var activity in value.data['data']) {
      if (activity['tarifas'] == null) {
        continue;
      }
      activityList.add(DTOActivity.fromJson(activity));
    }
    return activityList;
  });
}
