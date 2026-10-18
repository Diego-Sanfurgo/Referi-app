import '/providers/app_providers.dart';

// No server endpoint: auth is stateless JWT with nothing to invalidate remotely.
Future<bool> postAuthLogout() async {
  AppProviders.userProviderDeaf.clearSession();
  AppProviders.activityProviderDeaf.clearTimeRanges();
  return true;
}
