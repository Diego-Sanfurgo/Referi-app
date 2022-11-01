import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/user.dart';
import '../../utils/utils.dart' as util;
import '../../providers/app_providers.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/alert_controller.dart';
import '../../utils/validators_and_regexps.dart';

class NumberTextField extends StatefulWidget {
  final bool isEditing;
  final String label;
  final int? maxLength;
  const NumberTextField(
    this.isEditing, {
    Key? key,
    required this.label,
    this.maxLength,
  }) : super(key: key);

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    // controller = TextEditingController();
    controller = _initController(widget.label);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.text = selectProperty(widget.label, context);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Focus(
        onFocusChange: ((hasFocus) {
          if (!hasFocus) {
            // UserController.setFormValidationValue(Form.of(context)?.validate());
          }
        }),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: widget.maxLength ?? 10,
          decoration: InputDecoration(labelText: widget.label),
          textInputAction: TextInputAction.next,
          onSaved: (value) => UserController.addValueToUser(
              controller.text, util.removeAccentsToLowerCase(widget.label)),
          validator: Validators.numberValidator,
        ),
      ),
    );
  }
}

class NameTextField extends StatefulWidget {
  final bool isEditing;
  final String label;
  const NameTextField(this.isEditing, {Key? key, required this.label})
      : super(key: key);

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    // controller = TextEditingController();
    controller = _initController(widget.label);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.text = selectProperty(widget.label, context);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Focus(
        onFocusChange: ((hasFocus) {
          if (!hasFocus) {
            // UserController.setFormValidationValue(Form.of(context)?.validate());
          }
        }),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: widget.label),
          textInputAction: TextInputAction.next,
          onSaved: (value) => UserController.addValueToUser(
              controller.text, util.removeAccentsToLowerCase(widget.label)),
          validator: Validators.nameValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}

//TextField for DatePickers
class DateTextField extends StatefulWidget {
  final bool isEditing;
  final String label;

  const DateTextField(
    this.isEditing, {
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = _initController(widget.label);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.text = selectProperty(widget.label, context);

    return Focus(
      onFocusChange: ((hasFocus) {
        if (!hasFocus) {
          // UserController.setFormValidationValue(Form.of(context)?.validate());
        }
      }),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          keyboardType: TextInputType.datetime,
          decoration: const InputDecoration(labelText: "Fecha de nacimiento"),
          onTap: () async {
            String? chosenDate = await Alert.showDateAlert();
            if (chosenDate != null) {
              controller.text = chosenDate;
            }
          },
          validator: Validators.defaultValidator,
          onSaved: (value) =>
              UserController.addValueToUser(value!, "fechaNacimiento"),
        ),
      ),
    );
  }
}

TextEditingController _initController(String label) {
  return TextEditingController(text: selectProperty(label));
}

String selectProperty(String label) {
  String value = util.removeAccentsToLowerCase(label);
  User user = AppProviders.userProviderDeaf.currentUser;

  switch (value) {
    case "nombre":
      return user.nombre;
    case "apellido":
      return user.apellido;
    // case "numero":
    //   return user.domicilio.numero.toString();
    // case "calle":
    //   return user.domicilio.calle;
    case "telefono":
      return user.telefono ?? '';
    case "fecha de nacimiento":
      return DateFormat('dd/MM/yyyy', 'es,ES').format(user.fechaNacimiento);
    default:
      return '';
  }
}
