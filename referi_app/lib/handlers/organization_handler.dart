import 'package:referi_app/API/organizations/get_organization_by_id.dart';
import 'package:referi_app/API/organizations/get_organizations.dart';
import 'package:referi_app/controllers/alert_controller.dart';

import '../models/organization.dart';

abstract class OrganizationHandler {
  static Future<List<Organization>> obtainOrganizations() async {
    List<Organization>? orgList = await getOrganizations();

    if (orgList.isEmpty) {
      Alert.showError(
          "Ocurrió un error al cargas las instituciones, intente de nuevo.");
    }
    return orgList;
  }

  static Future<Organization?> obtaingOrganizationById(String orgId) async {
    var org = await getOrganizationById(orgId);

    if (org == null) {
      Alert.showError(
          "Ocurrió un error al cargar la institución. Inténtalo de nuevo.");
    }
    return org;
  }
}
