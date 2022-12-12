import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referi_app/widgets/forms/textfield.dart';
import 'package:sizer/sizer.dart';

import 'bloc/password_edit_bloc.dart';

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
  TextEditingController controller = TextEditingController();
  TextEditingController controllerRepeat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              const AutoSizeText(
                "Introduce una contraseña nueva",
                minFontSize: 16,
                maxFontSize: 26,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PasswordTextField(
                  "Contraseña nueva",
                  controller: controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PasswordTextField(
                  "Repetir contraseña",
                  controller: controllerRepeat,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Guardar")),
              )
            ],
          ),
        )
      ],
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          const AutoSizeText(
            "Introduce una contraseña nueva",
            minFontSize: 16,
            maxFontSize: 26,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PasswordTextField(
              "Contraseña nueva",
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PasswordTextField(
              "Repetir contraseña",
              controller: controllerRepeat,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Guardar")),
              )
            ],
          )
        ],
      ),
    );
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverToBoxAdapter(
    //       child: Padding(
    //         padding: const EdgeInsets.all(16),
    //         child: PasswordTextField(
    //           "Contraseña nueva",
    //           controller: controller,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
