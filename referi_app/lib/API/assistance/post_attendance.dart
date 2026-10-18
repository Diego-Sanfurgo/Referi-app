import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

final _orgIdPattern = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');

// The QR payload is whatever the camera read, so it has to be proven to be our
// own attendance endpoint before the session token is attached to it.
bool isValidAttendanceUrl(String? url) {
  if (url == null) return false;
  if (!url.startsWith(AssistanceUrls.postAttendanceByOrg)) return false;

  final orgId = url.substring(AssistanceUrls.postAttendanceByOrg.length);
  return _orgIdPattern.hasMatch(orgId);
}

Future<bool> postAttendance(String url) async {
  if (!isValidAttendanceUrl(url)) return false;

  Dio dio = Dio();

  Map body = {"id": AppProviders.userProviderDeaf.currentUserId};
  return await dio
      .post(url,
          options: Options(
            headers: getUserToken(),
            // A redirect away from our host would carry the token with it.
            followRedirects: false,
          ),
          data: body)
      .then((value) {
    return true;
  }).onError((error, stackTrace) => false);
}
