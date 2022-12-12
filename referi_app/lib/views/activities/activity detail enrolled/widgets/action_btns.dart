import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referi_app/models/enrollment.dart';

import '../bloc/activity_detail_enrolled_bloc.dart';

class ActionBtns extends StatelessWidget {
  final Enrollment enrollment;
  const ActionBtns(this.enrollment, {super.key});

  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider.of<ActivityDetailEnrolledBloc>(context);
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       onPressed: () {}, child: const Text("PAGAR CUOTA")),
              // ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () =>
                        blocProvider.add(CancelInscriptionEvent(enrollment)),
                    child: const Text("CANCELAR INSCRIPCIÓN")),
              )
            ],
          ),
        ));
  }
}
