import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/widgets/forms/textfields.dart';
import 'bloc/password_recover_bloc.dart';

class PassRecover extends StatelessWidget {
  const PassRecover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordRecoverBloc(),
      child: const _PassRecoverView(),
    );
  }
}

class _PassRecoverView extends StatelessWidget {
  const _PassRecoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar contraseña"),
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
    TextEditingController controller = TextEditingController();

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 30.h, 16, 0),
              child: Column(
                children: [
                  const AutoSizeText(
                    // "Introduce un correo electrónico para recibir una contraseña auxiliar.",
                    "Te enviaremos una contraseña auxiliar al correo electrónico que introduzcas a continuación.",
                    maxLines: 3,
                    maxFontSize: 24,
                    minFontSize: 18,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  NameTextField(false,
                      label: "Correo electrónico", fieldController: controller),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<PasswordRecoverBloc>(context)
                            .add(SendRecoveryEmail(controller.text, formKey)),
                    child: const Text('Enviar código')),
              ],
            ),
          ),
        )
      ],
    );
  }
}
