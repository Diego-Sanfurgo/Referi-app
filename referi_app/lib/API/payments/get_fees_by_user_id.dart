import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../models/activity_fee_payment.dart';

Future<List<ActivityFeePayment>> getFeesByUserId() async {
  Dio dio = Dio();

  List<ActivityFeePayment> list = [];

  return await dio
      .get(
        PaymentUrls.getFeesByUserId +
            AppProviders.userProviderDeaf.currentUser!.id,
        options: Options(headers: getUserToken()),
      )
      .then((value) {
        for (var fee in value.data["data"]) {
          list.add(ActivityFeePayment.fromJson(fee));
        }
        return list;
      })
      .onError((error, stackTrace) => list)
      .timeout(const Duration(seconds: 40), onTimeout: () => list);
}
