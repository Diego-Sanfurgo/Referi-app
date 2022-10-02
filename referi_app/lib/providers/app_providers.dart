import 'package:provider/provider.dart';

import 'user_provider.dart';
import 'navigation_provider.dart';

import 'package:referi_app/utils/utils.dart' as util;

abstract class AppProviders {
  static NavigationProvider get navigationProvider =>
      Provider.of<NavigationProvider>(util.actualContext);
  static NavigationProvider get navigationProviderDeaf =>
      Provider.of<NavigationProvider>(util.actualContext, listen: false);
  static UserProvider get userProvider =>
      Provider.of<UserProvider>(util.actualContext);
  static UserProvider get userProviderDeaf =>
      Provider.of<UserProvider>(util.actualContext, listen: false);
}
