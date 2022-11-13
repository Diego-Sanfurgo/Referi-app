import '../handlers/organization_handler.dart';

abstract class OrganizationController {
  static obtainOrganizations() async =>
      await OrganizationHandler.obtainOrganizations();
}
