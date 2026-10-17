import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

Future<bool> postVerify(String code) async {
  Dio dio = Dio();

  // A non-numeric code is a failed verification, not a crash.
  final int? parsedCode = int.tryParse(code);
  if (parsedCode == null) return false;

  Map body = {
    "email": AppProviders.userProviderDeaf.userRegisterModel.email,
    "code": parsedCode
  };

  try {
    final response = await dio
        .post(AuthUrls.postVerify, data: body)
        .timeout(const Duration(seconds: 40));

    // The endpoint answers 200 with {verified: false} for a wrong code, so the
    // status alone is not enough to tell whether verification succeeded.
    return response.data['verified'] == true;
  } catch (_) {
    return false;
  }
}
