import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/widgets/forms/textfield.dart';

class CurrentPasswordField extends StatelessWidget {
  const CurrentPasswordField({
    Key? key,
    required this.controllerCurrentPsw,
  }) : super(key: key);

  final TextEditingController controllerCurrentPsw;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AutoSizeText(
              "Por favor introduce tu contraseña actual",
              minFontSize: 16,
              maxFontSize: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: PasswordTextField(
                "Contraseña actual",
                controller: controllerCurrentPsw,
              ),
            )
          ],
        ),
      ),
    );
  }
}
