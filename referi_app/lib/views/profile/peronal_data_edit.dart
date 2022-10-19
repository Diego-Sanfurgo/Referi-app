import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/navigation_controller.dart';
import '../../widgets/forms/name_and_surname_fields.dart';
import '../../widgets/forms/street_and_number_fields.dart';

import '../../widgets/forms/textfield.dart';

class PersonalDataEdit extends StatelessWidget {
  const PersonalDataEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos personales"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: AutoSizeText(
              "Editar datos personales",
              style: TextStyle(fontWeight: FontWeight.w500),
              maxFontSize: 26,
              minFontSize: 22,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
              delegate: SliverChildListDelegate(
            const [
              NameAndSurnameTextFields(),
              DateTextField(
                "Fecha de nacimiento",
                keyboard: TextInputType.datetime,
                saveKeyLabel: 'fechaNacimiento',
              ),
              StreetAndNumberFields(),
              CustomTextField(
                "Teléfono",
                keyboard: TextInputType.phone,
                saveKeyLabel: "telefono",
                maxLength: 10,
              )
            ],
          )),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("Guardar cambios")),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => NavigationController.pop(),
                        child: const Text("Cancelar")))
              ],
            ),
          ),
        )
      ],
    );
  }
}
