import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../models/user.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Datos personales")),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = AppProviders.userProvider(context).currentUser as User;
    String date = DateFormat.yMd('es, ES').format(user.fechaNacimiento);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            _PersonalDataListTile(
                title: "Nombre y apellido",
                value: "${user.nombre} ${user.apellido}"),
            _PersonalDataListTile(
                title: "DNI", value: "${user.dni}", isEditable: false),
            _PersonalDataListTile(title: "Fecha de nacimiento", value: date),
            const _PersonalDataListTile(
                title: "Domicilio", value: "Sobremonte 385"),
            _PersonalDataListTile(
                title: "E-mail", value: user.email, isEditable: false),
            _PersonalDataListTile(title: "Teléfono", value: "${user.telefono}"),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: OutlinedButton.icon(
                  onPressed: () =>
                      NavigationController.goTo(Routes.personalDataEdit),
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text("Editar datos")),
            )
          ],
        ),
      ),
    );
  }
}

class _PersonalDataListTile extends StatefulWidget {
  final String title;
  final String value;
  final bool? isEditable;
  const _PersonalDataListTile(
      {Key? key,
      this.isEditable = true,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  State<_PersonalDataListTile> createState() => __PersonalDataListTileState();
}

class __PersonalDataListTileState extends State<_PersonalDataListTile> {
  @override
  Widget build(BuildContext context) {
    String value =
        widget.value == "" ? "Sin ${widget.title.toLowerCase()}" : widget.value;

    return ListTile(
      title: AutoSizeText(
        widget.title,
        maxFontSize: 20,
        minFontSize: 12,
      ),
      subtitle: AutoSizeText(value, maxFontSize: 16, minFontSize: 10),
    );
  }
}
