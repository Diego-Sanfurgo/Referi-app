import '../handlers/organization_handler.dart';
import '../models/organization.dart';

abstract class OrganizationController {
  static Future<List<Organization>> obtainOrganizations() async =>
      await OrganizationHandler.obtainOrganizations();

  static Future<Organization?> obtaingOrganizationById(String orgId) async =>
      await OrganizationHandler.obtaingOrganizationById(orgId);
}
