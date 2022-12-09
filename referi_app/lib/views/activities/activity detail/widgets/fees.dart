import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/models/dto/activity_fee_dto.dart';

class Fees extends StatelessWidget {
  final List<DTOActivityFee> fees;
  const Fees(this.fees, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tileFees = [];
    for (var fee in fees) {
      tileFees.add(_FeeTile(fee));
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Tarifas",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ...tileFees
        ],
      ),
    );
  }
}

class _FeeTile extends StatefulWidget {
  final DTOActivityFee fee;
  const _FeeTile(this.fee);

  @override
  State<_FeeTile> createState() => __FeeTileState();
}

class __FeeTileState extends State<_FeeTile> {
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    if (widget.fee.esOpcional!) {
      return CheckboxListTile(
          secondary: Text(widget.fee.nombre!),
          title: Text("\$${widget.fee.monto}"),
          visualDensity: VisualDensity.compact,
          value: boxValue,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            boxValue = value!;
            setState(() {});
          });
    }
    return ListTile(
      leading: Text(widget.fee.nombre!),
      title: Text("\$${widget.fee.monto}"),
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
    );
  }
}
