import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referi_app/views/activities/activity%20detail%20enrolled/widgets/activity_status.dart';

import '/models/enrollment.dart';

import 'widgets/action_btns.dart';
import 'widgets/time_ranges.dart';
import 'widgets/activity_fees.dart';
import 'widgets/activity_header.dart';
import 'bloc/activity_detail_enrolled_bloc.dart';

class ActivityDetailEnrolled extends StatelessWidget {
  const ActivityDetailEnrolled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityDetailEnrolledBloc(),
      child: const _ActivityDetailEnrolledView(),
    );
  }
}

class _ActivityDetailEnrolledView extends StatelessWidget {
  const _ActivityDetailEnrolledView({Key? key}) : super(key: key);

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
    return CustomScrollView(
      slivers: <Widget>[
        HeaderActivity(enrollment),
        ActivityFees(enrollment.turnoActividad.actividad.id),
        TimeRangesDescription(enrollment),
        ActivityStatus(enrollment),
        ActionBtns(enrollment)
      ],
    );
  }
}
