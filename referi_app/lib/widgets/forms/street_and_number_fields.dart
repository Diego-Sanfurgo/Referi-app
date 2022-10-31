import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../widgets/forms/textfields.dart';

class StreetAndNumberFields extends StatelessWidget {
  final bool isEditing;
  const StreetAndNumberFields(this.isEditing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 50.w, child: NameTextField(isEditing, label: "Calle")),
        SizedBox(
            width: 30.w,
            child: NumberTextField(isEditing, label: "Número", maxLength: 5))
      ],
    );
  }
}
