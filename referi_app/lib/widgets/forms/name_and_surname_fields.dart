import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../widgets/forms/textfields.dart';

class NameAndSurnameTextFields extends StatelessWidget {
  final bool isEditing;
  const NameAndSurnameTextFields(this.isEditing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 40.w, child: NameTextField(isEditing, label: "Nombre")),
        SizedBox(
            width: 40.w, child: NameTextField(isEditing, label: "Apellido"))
      ],
    );
  }
}
