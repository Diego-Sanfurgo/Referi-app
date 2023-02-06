import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '/controllers/navigation_controller.dart';

class SuccessAttendance extends StatelessWidget {
  const SuccessAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 10),
    //     () => NavigationController.goTo(Routes.home, popUntil: true));
    return const Scaffold(
      body: _Animation(),
    );
  }
}

class _Animation extends StatelessWidget {
  const _Animation();

  @override
  Widget build(BuildContext context) {
    double size = 80.w;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 16),
            child: LottieBuilder.asset(
              'assets/animations/lottie_success_attendance.zip',
              width: size,
              height: size,
              repeat: false,
            ),
          ),
          const SizedBox(height: 16),
          const AutoSizeText(
            "¡Has marcado tu asistencia correctamente! \n\nEl portero debería poder visualizar tus datos, espera a que te lo confirme.",
            minFontSize: 20,
            maxFontSize: 26,
            textAlign: TextAlign.center,
          ),
          const _ActionBtn()
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () =>
                NavigationController.goTo(Routes.home, popUntil: true),
            child: const Text("Volver")),
      ],
    ));
  }
}
