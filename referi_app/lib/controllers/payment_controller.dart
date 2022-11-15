import 'package:referi_app/handlers/payment_handler.dart';
import 'package:referi_app/models/activity_fee_payment.dart';
import 'package:referi_app/models/payment_detail.dart';

abstract class PaymentController {
  static Future<bool> payActivity(List<String> feesId) async {
    return await PaymentHandler.payActivityFee(feesId);
  }

  static Future<List<ActivityFeePayment>> getUserFees() async {
    return await PaymentHandler.obtainFeesByUser();
  }

  static Future<PaymentDetail?> obtainPaymentById(String id) async =>
      await PaymentHandler.obtainPaymentById(id);
}
