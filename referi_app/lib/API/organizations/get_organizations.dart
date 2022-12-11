import 'package:referi_app/API/params.dart';

import 'package:dio/dio.dart';
import 'package:referi_app/models/dto/organization_dto.dart';

Future<List<DTOOrganization>> getOrganizations() async {
  Dio dio = Dio();

  String url = OrganizationUrls.getOrganizations;

  // List<Organization> orgList = [];
  List<DTOOrganization> orgList = [];

  return await dio
      .get(url, options: Options(headers: getUserToken()))
      .then((value) {
        for (var org in value.data['data']) {
          // orgList.add(Organization.fromJson(org));
          orgList.add(DTOOrganization.fromJson(org));
        }
        return orgList;
      })
      .onError((error, stackTrace) => orgList)
      .timeout(
        const Duration(seconds: 40),
        onTimeout: () => orgList,
      );
}
