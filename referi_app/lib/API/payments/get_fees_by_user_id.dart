import 'dart:developer';

import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';
import '/models/activity_fee_payment.dart';

Future<List<ActivityFeePayment>> getFeesByUserId() async {
  Dio dio = Dio();

  List<ActivityFeePayment> list = [];

  String url = PaymentUrls.getFeesByUserId +
      AppProviders.userProviderDeaf.currentUser!.id;

  return await dio
      .get(url, options: Options(headers: getUserToken()))
      .then((value) {
    for (var fee in value.data["data"]) {
      if (fee['tarifa'] == null) {
        continue;
      }
      list.add(ActivityFeePayment.fromJson(fee));
    }
    return list;
  }).onError((error, stackTrace) {
    log(error.toString());
    throw Exception(error);
  }).timeout(const Duration(seconds: 40), onTimeout: () => list);
}
