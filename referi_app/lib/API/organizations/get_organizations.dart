import 'package:referi_app/API/params.dart';

import 'package:dio/dio.dart';
import 'package:referi_app/models/organization.dart';

Future<List<Organization>?> getOrganizations() async {
  Dio dio = Dio();

  String url = OrganizationUrls.getOrganizations;

  List<Organization> orgList = [];

  return await dio
      .get(url, options: Options(headers: getUserToken()))
      .then((value) {
        for (var org in value.data['data']) {
          orgList.add(Organization.fromJson(org));
        }
      })
      .onError((error, stackTrace) => null)
      .timeout(
        const Duration(seconds: 40),
        onTimeout: () => null,
      );
}
