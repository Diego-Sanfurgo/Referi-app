import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/alert_controller.dart';
import '../../controllers/signup_controller.dart';
import '../../controllers/user_controller.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String saveKeyLabel;
  final TextInputType keyboard;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool showCounter;
  final void Function()? onTap;
  final void Function(String?)? onChaged;

  const CustomTextField(
    this.labelText, {
    Key? key,
    required this.keyboard,
    required this.saveKeyLabel,
    this.validator,
    this.maxLength = 50,
    this.showCounter = true,
    this.onTap,
    this.onChaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RegExp formatter = getFormatter(keyboard);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Focus(
        onFocusChange: ((hasFocus) {
          if (!hasFocus) {
            UserController.setFormValidationValue(Form.of(context)?.validate());
          }
        }),
        child: TextFormField(
          style: const TextStyle(fontSize: 14),
          keyboardType: keyboard,
          maxLength: showCounter ? maxLength : null,
          decoration: InputDecoration(labelText: labelText),
          textInputAction: TextInputAction.next,
          onTap: onTap,
          onChanged: onChaged,
          onSaved: (value) => SignUpController.saveValue(value!, saveKeyLabel),
          // inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          validator: validator ?? _validator,
        ),
      ),
    );
  }
}

//Textfield for passwords
class PasswordTextField extends StatefulWidget {
  final String label;
  final bool saveField;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final String? helperText;

  const PasswordTextField(
    this.label, {
    Key? key,
    this.validator,
    this.saveField = true,
    this.controller,
    this.onChange,
    this.helperText,
  }) : super(key: key);
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
      controller: widget.controller ?? controller,
      obscureText: obscureText,
      validator: widget.validator ?? _validator,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChange,
      onEditingComplete: () =>
          UserController.setFormValidationValue(Form.of(context)?.validate()),
      onSaved: widget.saveField
          ? (value) => SignUpController.saveValue(value!, 'password')
          : null,
      decoration: InputDecoration(
        errorMaxLines: 3,
        helperText: widget.helperText,
        label: AutoSizeText(widget.label),
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
          _RuleText("Debe tener entre 8 y 12 caracteres"),
          _RuleText("Debe incluir mayúsculas y minúsculas"),
          _RuleText("Debe incluir al menos un carácter especial")
        ],
      ),
    );
  }
}

class _RuleText extends StatefulWidget {
  final String text;

  const _RuleText(this.text, {Key? key}) : super(key: key);

  @override
  State<_RuleText> createState() => _RuleTextState();
}

class _RuleTextState extends State<_RuleText> {
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

//TextField for DatePickers
class DateTextField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboard;
  final String? Function(String?)? validator;
  final String saveKeyLabel;

  const DateTextField(
    this.labelText, {
    Key? key,
    required this.keyboard,
    required this.saveKeyLabel,
    this.validator,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: ((hasFocus) {
        if (!hasFocus) {
          UserController.setFormValidationValue(Form.of(context)?.validate());
        }
      }),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          keyboardType: widget.keyboard,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(labelText: widget.labelText),
          onTap: () async {
            String? chosenDate = await Alert.showDateAlert();
            if (chosenDate != null) {
              controller.text = chosenDate;
            }
          },
          validator: widget.validator ?? _validator,
          onSaved: (value) =>
              SignUpController.saveValue(value!, widget.saveKeyLabel),
        ),
      ),
    );
  }
}

String? _validator(String? value) {
  if (value != null && value.isNotEmpty) {
    return null;
  }
  return "Completar campo.";
}

// RegExp getFormatter(TextInputType keyboard) {
//   if (keyboard == TextInputType.emailAddress) {
//     return RegExp(
//         r"([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)");
//   } else {
//     return RegExp(
//         r'([^0-9\.\,\"\?\!\;\:\#\$\%\&\(\)\*\+\-\/\<\>\=\@\[\]\\\^\_\{\}\|\~]+)');
//   }
// }
