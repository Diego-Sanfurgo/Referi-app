import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/theme/colors.dart' as colors;
import '/controllers/navigation_controller.dart';

import 'widgets/profile_image.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          const ProfileImage(),
          const AutoSizeText("Tu foto se podrá usar para credenciales.",
              maxFontSize: 16, minFontSize: 12),
          Divider(color: colors.secondaryDark, height: 8),
          const _ActionsList(),
        ],
      ),
    );
  }
}

class _ActionsList extends StatelessWidget {
  const _ActionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const AutoSizeText("Datos personales"),
            onTap: () => NavigationController.goTo(Routes.personalData),
          ),
          ListTile(
            leading: const Icon(Icons.shield_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const AutoSizeText("Editar contraseña"),
            onTap: () => NavigationController.goTo(Routes.passwordEdit),
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: const AutoSizeText("Cerrar sesión"),
            onTap: () =>
                NavigationController.goTo(Routes.login, popUntil: true),
          ),
        ],
      ),
    );
  }
}
