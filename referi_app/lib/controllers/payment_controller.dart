import '/models/payment_detail.dart';
import '/handlers/payment_handler.dart';
import '/models/activity_fee_payment.dart';

abstract class PaymentController {
  static Future<bool> payActivity(List<String> feesId) async {
    return await PaymentHandler.payActivityFee(feesId);
  }

  static Future<List<ActivityFeePayment>> getUserFees() async =>
      await PaymentHandler.obtainFeesByUser();

  static Future<PaymentDetail?> obtainPaymentById(String id) async =>
      await PaymentHandler.obtainPaymentById(id);
}
