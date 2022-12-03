import 'package:flutter/material.dart';

import '/theme/colors.dart' as colors;
import '/controllers/navigation_controller.dart';
import '/models/activity_fee_payment.dart';

class OperationTile extends StatelessWidget {
  const OperationTile({
    Key? key,
    required this.cuota,
    required this.icon,
    required this.iconColor,
    required this.statusText,
  }) : super(key: key);

  final ActivityFeePayment cuota;
  final IconData icon;
  final Color iconColor;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => NavigationController.goToWithArguments(
          Routes.operationDetail,
          args: cuota),
      leading: _TileLeadingIcon(icon, color: iconColor),
      title: Text(cuota.tarifa.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(cuota.actividad.nombre),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("\$${cuota.tarifa.monto}",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(statusText),
        ],
      ),
    );
  }
}

class _TileLeadingIcon extends StatelessWidget {
  final Color? color;
  final IconData icon;
  const _TileLeadingIcon(this.icon, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? colors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white));
  }
}
