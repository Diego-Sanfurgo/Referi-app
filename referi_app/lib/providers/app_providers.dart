import 'package:provider/provider.dart';
import 'package:referi_app/providers/activity_provider.dart';

import 'user_provider.dart';
import 'navigation_provider.dart';

import 'package:referi_app/utils/utils.dart' as util;

abstract class AppProviders {
  static NavigationProvider navigationProvider(context) =>
      Provider.of<NavigationProvider>(context);
  static NavigationProvider get navigationProviderDeaf =>
      Provider.of<NavigationProvider>(util.actualContext, listen: false);
  // static UserProvider get userProvider =>
  //     Provider.of<UserProvider>(util.actualContext);
  static UserProvider userProvider(context) =>
      Provider.of<UserProvider>(context);
  static UserProvider get userProviderDeaf =>
      Provider.of<UserProvider>(util.actualContext, listen: false);

  static ActivityProvider activityProvider(context) =>
      Provider.of<ActivityProvider>(context);
  static ActivityProvider get activityProviderDeaf =>
      Provider.of<ActivityProvider>(util.actualContext, listen: false);
}
