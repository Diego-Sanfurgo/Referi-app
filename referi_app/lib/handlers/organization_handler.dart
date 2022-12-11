import '../models/organization.dart';
import '/controllers/alert_controller.dart';
import '../models/dto/organization_dto.dart';
import '/API/organizations/get_organizations.dart';
import '/API/organizations/get_organization_by_id.dart';

abstract class OrganizationHandler {
  static Future<List<DTOOrganization>> obtainOrganizations() async {
    // List<Organization>? orgList = await getOrganizations();
    List<DTOOrganization>? orgList = await getOrganizations();

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
