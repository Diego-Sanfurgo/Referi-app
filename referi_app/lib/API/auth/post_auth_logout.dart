import '/providers/app_providers.dart';

Future<bool> postAuthLogout() async {
  AppProviders.userProviderDeaf.clearUser();
  return true;
}
