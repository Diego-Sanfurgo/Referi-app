import 'package:flutter/material.dart';

import 'package:referi_app/widgets/forms/textfield.dart';

import 'package:sizer/sizer.dart';

class StreetAndNumberFields extends StatelessWidget {
  const StreetAndNumberFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 50.w,
            child: const CustomTextField(
              "Calle",
              keyboard: TextInputType.streetAddress,
              showCounter: false,
              saveKeyLabel: "calle",
            )),
        SizedBox(
            width: 30.w,
            child: CustomTextField(
              "Número",
              keyboard: TextInputType.number,
              showCounter: false,
              maxLength: 10,
              saveKeyLabel: "numero",
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return "Completar";
              },
            )),
      ],
    );
  }
}
