import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/models/payment_detail.dart';

Future<PaymentDetail?> getPaymetById(String id) async {
  Dio dio = Dio();

  return await dio
      .get(PaymentUrls.getPaymentById + id)
      .then((value) {
        if (value.data == '' || value.data == null) {
          return null;
        }
        return PaymentDetail.fromJson(value.data);
      })
      .onError((error, stackTrace) => null)
      .timeout(
        const Duration(seconds: 40),
        onTimeout: () => null,
      );
}
