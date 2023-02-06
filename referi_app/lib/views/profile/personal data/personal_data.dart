import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '/models/user.dart';
import '/providers/app_providers.dart';
import '/controllers/navigation_controller.dart';

import 'widgets/personal_data_tile.dart';

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
    User user = AppProviders.userProvider(context).currentUser!;
    String date = DateFormat.yMd('es, ES').format(user.fechaNacimiento);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            PersonalDataListTile(
                title: "Nombre y apellido",
                value: "${user.nombre} ${user.apellido}"),
            PersonalDataListTile(title: "DNI", value: "${user.dni}"),
            PersonalDataListTile(title: "Fecha de nacimiento", value: date),
            PersonalDataListTile(
                title: "Domicilio",
                value: "${user.domicilio.calle} ${user.domicilio.numero}"),
            PersonalDataListTile(title: "E-mail", value: user.email),
            PersonalDataListTile(title: "Teléfono", value: "${user.telefono}"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              width: double.infinity,
              child: OutlinedButton.icon(
                  onPressed: () =>
                      NavigationController.goTo(Routes.personalDataEdit),
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text("Editar datos")),
            ),
          ],
        ),
      ),
    );
  }
}
