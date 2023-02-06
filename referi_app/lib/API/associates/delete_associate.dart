import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> deleteAssociate(String associateId) async {
  Dio dio = Dio();

  String url = AssociatesUrls.deleteEnrollmentByAssociateId + associateId;

  return await dio
      .delete(url, options: Options(headers: getUserToken()))
      .then((value) {
    return true;
  }).onError((error, stackTrace) => false);
}
