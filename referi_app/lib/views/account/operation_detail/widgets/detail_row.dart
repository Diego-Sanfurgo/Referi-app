import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailRow extends StatelessWidget {
  final int index;
  final Map<String, String> dataFields;

  const DetailRow(this.index, this.dataFields, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(dataFields.keys.elementAt(index),
              style: const TextStyle(fontSize: 16, color: Colors.black)),
          SizedBox(
              width: 40.w,
              child: Text(
                dataFields.values.elementAt(index),
                textAlign: TextAlign.right,
              ))
        ],
      ),
    );
  }
}
