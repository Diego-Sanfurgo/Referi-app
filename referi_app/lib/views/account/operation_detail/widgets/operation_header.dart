import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '/theme/colors.dart' as colors;
import '/models/activity_fee_payment.dart';

class OperationHeader extends StatelessWidget {
  const OperationHeader({
    Key? key,
    required this.organizationName,
    required this.feePayment,
  }) : super(key: key);

  final String organizationName;
  final ActivityFeePayment feePayment;

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AutoSizeText(
            organizationName,
            minFontSize: 16,
            maxFontSize: 24,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        AutoSizeText(
          "\$${feePayment.monto}",
          minFontSize: 28,
          maxFontSize: 48,
          style: const TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
      ],
    );

    Map<String, Color> headerColors = _getColors(feePayment);

    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        color: headerColors['secondary'],
        height: 35.h,
        padding: const EdgeInsets.only(bottom: 25),
        child: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            color: headerColors['primary'],
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: column,
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, Color> _getColors(ActivityFeePayment feePayment) {
  if (feePayment.pago != null) {
    //Pagado
    return {
      // "primary": Colors.lightGreen.shade300,
      // "secondary": Colors.lightGreen.shade200
      "primary": Colors.green.shade300,
      "secondary": Colors.green.shade200
    };
  }
  if (feePayment.pago == null &&
      DateTime.now().isBefore(feePayment.fechaVencimiento)) {
    // Pendiente
    return {
      "primary": colors.primary.shade300,
      "secondary": colors.primary.shade200
    };
  }

  // Vencido
  return {"primary": Colors.red.shade300, "secondary": Colors.red.shade200};
}
