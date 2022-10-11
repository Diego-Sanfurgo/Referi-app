import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/controllers/navigation_controller.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            const _PersonalDataListTile(
                title: "Nombre y apellido", value: "Diego Sanfurgo"),
            const _PersonalDataListTile(
                title: "DNI", value: "41.363.675", isEditable: false),
            const _PersonalDataListTile(
                title: "Fecha de nacimiento", value: "18/08/1998"),
            const _PersonalDataListTile(
                title: "Domicilio", value: "Sobremonte 385"),
            const _PersonalDataListTile(
                title: "E-mail", value: "ejemplo@gmail.com", isEditable: false),
            const _PersonalDataListTile(title: "Teléfono", value: "1234567890"),
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
    return ListTile(
      // trailing:
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
      title: AutoSizeText(
        widget.title,
        maxFontSize: 20,
        minFontSize: 12,
      ),
      subtitle: AutoSizeText(widget.value, maxFontSize: 16, minFontSize: 10),
    );
  }
}
