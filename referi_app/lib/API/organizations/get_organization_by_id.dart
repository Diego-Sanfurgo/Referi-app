import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/organization.dart';

Future<Organization?> getOrganizationById(String orgId) async {
  Dio dio = Dio();

  late final Organization? org;

  await dio
      .get(
    OrganizationUrls.getOrganizationById + orgId,
    options: Options(headers: getUserToken()),
  )
      .then((value) {
    org = Organization.fromJson(value.data);
  }).onError((error, stackTrace) {
    org = null;
  }).timeout(const Duration(seconds: 40), onTimeout: () {
    org = null;
  });
  return org;
}
