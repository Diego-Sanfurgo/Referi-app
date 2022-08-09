import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboard;

  const CustomTextField(this.labelText, {Key? key, required this.keyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: TextFormField(
        style: const TextStyle(fontSize: 14),
        keyboardType: keyboard,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          }
          return "Debe completar este campo.";
        },
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}

//Textfield for passwords
class PasswordTextField extends StatefulWidget {
  final String label;

  const PasswordTextField(this.label, {Key? key}) : super(key: key);
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon =
        obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: AutoSizeText(widget.label),
        // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        suffixIcon: IconButton(
          icon: Icon(icon),
          onPressed: () {
            obscureText = !obscureText;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class PasswordRules extends StatelessWidget {
  const PasswordRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 10.h,
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          RuleText("Debe tener entre 8 y 12 caracteres"),
          RuleText("Debe incluir mayúsculas y minúsculas"),
          RuleText("Debe incluir al menos un carácter especial")
        ],
      ),
    );
  }
}

class RuleText extends StatefulWidget {
  final String text;

  const RuleText(this.text, {Key? key}) : super(key: key);

  @override
  State<RuleText> createState() => _RuleTextState();
}

class _RuleTextState extends State<RuleText> {
  AutoSizeGroup rulesGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AutoSizeText(
        "${String.fromCharCode(0x2022)} ${widget.text}",
        group: rulesGroup,
        maxLines: 2,
        minFontSize: 10,
        maxFontSize: 14,
        softWrap: true,
        style: const TextStyle(fontSize: 11),
      ),
    );
  }
}
