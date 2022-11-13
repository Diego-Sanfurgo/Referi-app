import 'package:referi_app/API/organizations/get_organizations.dart';
import 'package:referi_app/controllers/alert_controller.dart';

import '../models/organization.dart';

abstract class OrganizationHandler {
  static Future<List<Organization>> obtainOrganizations() async {
    List<Organization>? orgList = await getOrganizations();

    if (orgList == null) {
      Alert.showError(
          "Ocurrió un error al cargas las instituciones, intente de nuevo.");
    }
    return orgList!;
  }
}
