import 'package:referi_app/API/params.dart';

import 'package:dio/dio.dart';
import 'package:referi_app/models/organization.dart';

Future getOrganizations() async {
  Dio dio = Dio();

  String url = OrganizationUrls.getOrganizations;

  List<Organization> orgList = [];

  await dio
      .get(url)
      .then((value) {
        for (var org in value.data) {
          orgList.add(Organization.fromJson(org));
        }
      })
      .onError((error, stackTrace) {})
      .timeout(const Duration(seconds: 40));
}
