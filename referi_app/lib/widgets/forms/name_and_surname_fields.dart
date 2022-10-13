import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'package:referi_app/widgets/forms/textfield.dart';

class NameAndSurnameTextFields extends StatelessWidget {
  const NameAndSurnameTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 40.w,
            child: const CustomTextField(
              "Nombre",
              keyboard: TextInputType.name,
              showCounter: false,
              saveKeyLabel: "nombre",
            )),
        SizedBox(
            width: 40.w,
            child: const CustomTextField(
              "Apellido",
              keyboard: TextInputType.name,
              showCounter: false,
              saveKeyLabel: "apellido",
            )),
      ],
    );
  }
}
