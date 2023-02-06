import '/API/payments/pay_fee.dart';
import '/models/payment_detail.dart';
import '/models/activity_fee_payment.dart';
import '../controllers/general_alert_controller.dart';
import '/API/payments/get_payment_by_id.dart';
import '/API/payments/get_fees_by_user_id.dart';
import '/controllers/navigation_controller.dart';

abstract class PaymentHandler {
  static Future<bool> payActivityFee(List<String> feesId) async {
    GeneralAlert.showLoading();
    bool isOK = await payFee(feesId);

    NavigationController.pop();
    if (!isOK) {
      GeneralAlert.showError(
          "Ocurrió un error al intentar pagar la cuota. Intenta nuevamente");
      return false;
    }
    return true;
  }

  static Future<List<ActivityFeePayment>> obtainFeesByUser() async =>
      await getFeesByUserId();

  static Future<PaymentDetail?> obtainPaymentById(String id) async {
    var payment = await getPaymetById(id);
    if (payment == null) {
      GeneralAlert.showError(
          "Ocurrió un error al leer el detalle del pago. Intenta nuevamente.");
      return null;
    }
    return payment;
  }
}
