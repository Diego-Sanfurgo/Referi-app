import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

Future postInscribirActividad() async {
  Dio dio = Dio();

  Map body = {
    "idUsuario": AppProviders.userProviderDeaf.currentUser!.id,
    "idTurnoActividad":
        AppProviders.activityProviderDeaf.timeRangesSelected.first.keys.first,
  };

  await dio
      .post(
    ActivityUrls.postInscripcion,
    data: body.toString(),
    options: Options(headers: getUserToken()),
  )
      .then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 40), onTimeout: () => false);
}
