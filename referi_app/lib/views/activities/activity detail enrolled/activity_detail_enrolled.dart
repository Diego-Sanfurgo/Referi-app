import 'package:flutter/material.dart';

import '/models/enrollment.dart';

import 'widgets/activity_fees.dart';
import 'widgets/activity_header.dart';

class ActivityDetailEnrolled extends StatelessWidget {
  const ActivityDetailEnrolled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enrollment = ModalRoute.of(context)!.settings.arguments as Enrollment;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de actividad")),
      body: _Body(enrollment),
    );
  }
}

class _Body extends StatelessWidget {
  final Enrollment enrollment;
  const _Body(this.enrollment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget actionBtn = ValueListenableBuilder(
    //   valueListenable: AppProviders.activityProvider(context).activeFlag,
    //   builder: (BuildContext context, bool value, Widget? child) {
    //     return ElevatedButton(
    //         onPressed: value
    //             ? () => NavigationController.goToWithArguments(
    //                 Routes.activityPayment,
    //                 args: activity)
    //             : null,
    //         child: const Text("INSCRIBIRSE"));
    //   },
    // );
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                HeaderActivity(enrollment),
                // TimeRanges(activity.turnos),
                ActivityFees(enrollment.turnoActividad.actividad.id),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // children: [actionBtn],
              )),
        ),
      ],
    );
  }
}
