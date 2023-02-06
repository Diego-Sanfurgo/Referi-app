import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> payFee(List<String> feesId) async {
  Dio dio = Dio();

  Map body = {
    "medioDePago": "TRANSFERENCIA",
    "numeroDeComprobante": "",
    "idsCuota": feesId
  };

  return await dio
      .post(PaymentUrls.postPayFee,
          data: jsonEncode(body), options: Options(headers: getUserToken()))
      .then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(
    const Duration(seconds: 40),
    onTimeout: () => false,
  );
}
