import 'package:referi_app/API/payments/get_fees_by_user_id.dart';
import 'package:referi_app/API/payments/get_payment_by_id.dart';
import 'package:referi_app/API/payments/pay_fee.dart';
import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/models/payment_detail.dart';

import '../models/activity_fee_payment.dart';

abstract class PaymentHandler {
  static Future<bool> payActivityFee(List<String> feesId) async {
    Alert.showLoading();
    bool isOK = await payFee(feesId);

    NavigationController.pop();
    if (!isOK) {
      Alert.showError(
          "Ocurrió un error al intentar pagar la cuota. Intenta nuevamente");
      return false;
    }
    return true;
  }

  static Future<List<ActivityFeePayment>> obtainFeesByUser() async {
    // Alert.showLoading();
    List<ActivityFeePayment> list = await getFeesByUserId();
    // NavigationController.pop();
    return list;
  }

  static Future<PaymentDetail?> obtainPaymentById(String id) async {
    // Alert.showLoading();
    var payment = await getPaymetById(id);
    // NavigationController.pop();
    if (payment == null) {
      Alert.showError(
          "Ocurrió un error al leer el detalle del pago. Intenta nuevamente.");
      return null;
    }
    return payment;
  }
}
