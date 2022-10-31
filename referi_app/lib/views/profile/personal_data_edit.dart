import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:referi_app/controllers/user_controller.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../controllers/navigation_controller.dart';
import '../../models/user_register.dart';
import '../../widgets/forms/name_and_surname_fields.dart';
import '../../widgets/forms/street_and_number_fields.dart';

import '../../widgets/forms/textfields.dart';

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
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        _PersonalDataForm(formKey),
        _Buttons(formKey)
      ],
    );
  }
}

class _PersonalDataForm extends StatelessWidget {
  final Key formKey;
  const _PersonalDataForm(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
          child: Form(
        key: formKey,
        child: Column(
          children: const [
            NameAndSurnameTextFields(true),
            DateTextField(true, label: "Fecha de nacimiento"),
            StreetAndNumberFields(true),
            NumberTextField(true, label: "Teléfono", maxLength: 10),
          ],
        ),
      )),
    );
  }
}

class _Buttons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _Buttons(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRegister user = AppProviders.userProvider(context).userRegisterModel;

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () => UserController.updateUser(user),
                child: const Text("Guardar cambios")),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => NavigationController.pop(),
                    child: const Text("Cancelar")))
          ],
        ),
      ),
    );
  }
}
