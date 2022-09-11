import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/widgets/forms/textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _Header(),
              _Body(),
              SizedBox(height: 64),
              _Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(flip: true),
      child: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: const Center(
          child: AutoSizeText(
            "Bienvenido a Referí",
            maxLines: 1,
            maxFontSize: 34,
            minFontSize: 26,
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: AutoSizeText(
              "Iniciar sesión",
              maxLines: 1,
              maxFontSize: 22,
              minFontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Form(
                child: Column(
              children: const [
                CustomTextField(
                  "Correo electrónico",
                  keyboard: TextInputType.emailAddress,
                  saveKeyLabel: 'email',
                ),
                PasswordTextField("Contraseña")
              ],
            )),
          ),
          const AutoSizeText("¿Olvidaste tu contraseña?",
              style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () => NavigationController.goTo(Routes.home),
              child: const Text("INGRESAR")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AutoSizeText("Si no tienes cuenta"),
              TextButton(
                  onPressed: () => NavigationController.goTo(Routes.signup_1),
                  child: const AutoSizeText(
                    "Registrate",
                    style: TextStyle(
                      color: Color(0XFF0C9EE8),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
