import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:referi_app/widgets/forms/textfield.dart';

class NewPasswordFields extends StatelessWidget {
  const NewPasswordFields({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.controllerRepeat,
    required this.controllerToCompare,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextEditingController controllerRepeat;
  final TextEditingController controllerToCompare;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            // SizedBox(height: 30.h),
            const AutoSizeText(
              "Introduce una contraseña nueva",
              minFontSize: 16,
              maxFontSize: 26,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: PasswordTextField(
                "Contraseña nueva",
                controller: controller,
                onChange: (_) => formKey.currentState?.validate(),
                validator: (p0) {
                  if (p0 == controllerToCompare.text) {
                    return "La contraseña nueva debe ser distinta de la actual";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: PasswordTextField(
                "Repetir contraseña",
                controller: controllerRepeat,
                onChange: (p0) {
                  formKey.currentState?.validate();
                },
                validator: (p0) {
                  if (p0 == "") {
                    return null;
                  }
                  if (p0 != controller.text) {
                    return "Las contraseñas no coinciden";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
