import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

class CredentialHome extends StatelessWidget {
  const CredentialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemCount: 2,
        itemBuilder: ((context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            elevation: 3,
            child: ListTile(
              onTap: () => NavigationController.goTo(Routes.credentialDetail),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              leading: Image.asset(
                'assets/images/perfil_prueba.png',
              ),
              title: const Text("Club Obras"),
              subtitle: const Text("Estado: Activo"),
            ),
          );
        }));
  }
}
