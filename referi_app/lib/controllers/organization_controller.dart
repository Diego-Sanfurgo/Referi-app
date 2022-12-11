import '../handlers/organization_handler.dart';
import '../models/dto/organization_dto.dart';
import '../models/organization.dart';

abstract class OrganizationController {
  static Future<List<DTOOrganization>> obtainOrganizations() async =>
      await OrganizationHandler.obtainOrganizations();

  static Future<Organization?> obtaingOrganizationById(String orgId) async =>
      await OrganizationHandler.obtaingOrganizationById(orgId);
}
