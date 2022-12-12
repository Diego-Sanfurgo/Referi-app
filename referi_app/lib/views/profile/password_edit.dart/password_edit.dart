import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/password_edit_bloc.dart';
import 'widgets/new_password_fields.dart';
import 'widgets/current_password_field.dart';

class PasswordEdit extends StatelessWidget {
  const PasswordEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordEditBloc(),
      child: const _PasswordEditView(),
    );
  }
}

class _PasswordEditView extends StatelessWidget {
  const _PasswordEditView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar contraseña")),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  TextEditingController controllerNewPsw = TextEditingController();
  TextEditingController controllerRepeat = TextEditingController();
  TextEditingController controllerCurrentPsw = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(height: 20.h),
        ),
        CurrentPasswordField(controllerCurrentPsw: controllerCurrentPsw),
        NewPasswordFields(
          formKey: formKey,
          controller: controllerNewPsw,
          controllerRepeat: controllerRepeat,
          controllerToCompare: controllerCurrentPsw,
        ),
        BlocBuilder<PasswordEditBloc, PasswordEditState>(
          builder: (context, state) {
            bool hasError = state is PasswordEditError;

            return SliverVisibility(
              visible: hasError,
              sliver: const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: AutoSizeText(
                    "Ocurrió un error al intentar actualizar la contraseña. Revisa los datos ingresados e intenta de nuevo.",
                    minFontSize: 16,
                    maxFontSize: 22,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          },
        ),
        ActionBtn(
          controllerCurrentPsw: controllerCurrentPsw,
          controllerNewPsw: controllerNewPsw,
        )
      ],
    );
  }
}

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    Key? key,
    required this.controllerCurrentPsw,
    required this.controllerNewPsw,
  }) : super(key: key);

  final TextEditingController controllerCurrentPsw;
  final TextEditingController controllerNewPsw;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PasswordEditBloc>(context).add(
                      SubmitChangePassword(
                          controllerCurrentPsw.text, controllerNewPsw.text));
                },
                child: const Text("Guardar")),
          )
        ],
      ),
    );
  }
}
