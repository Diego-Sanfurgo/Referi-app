import 'package:flutter/material.dart';
import 'package:referi_app/controllers/fee_controller.dart';
import 'package:referi_app/theme/animations/activities_not_found.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../models/activity_fee.dart';
import '../../models/enrollment.dart';
import '../../theme/colors.dart' as colors;
import '../../controllers/navigation_controller.dart';
import '../../widgets/activities/fees.dart';

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
                _HeaderActivity(enrollment),
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

class _HeaderActivity extends StatelessWidget {
  final Enrollment enrollment;
  const _HeaderActivity(this.enrollment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activity = enrollment.turnoActividad.actividad;
    Widget nameAndInstitute = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            activity.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxFontSize: 22,
            minFontSize: 18,
          ),
          GestureDetector(
            onTap: () => NavigationController.goTo(Routes.clubDetail),
            child: AutoSizeText(
              enrollment.organizacion.nombre,
              style: TextStyle(color: colors.secondaryDark),
              maxFontSize: 16,
              minFontSize: 12,
            ),
          ),
        ],
      ),
    );
    Widget activityDescription = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Visibility(
          visible: activity.descripcion != null ? true : false,
          child: ExpandableText(
            activity.descripcion!,
            expandText: "ver más",
            collapseText: "ver menos",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkStyle: const TextStyle(fontWeight: FontWeight.bold),
            style: TextStyle(color: Colors.grey.shade700),
          )),
    );

    Widget activityImage = Container(
      padding: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: activity.imgUrl != null
          ? Image.network(
              activity.imgUrl!,
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
            )
          : Image.asset(
              "assets/images/no_image_placeholder.png",
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
            ),
    );

    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          activityImage,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameAndInstitute,
                activityDescription,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActivityFees extends StatelessWidget {
  final String activityId;
  const ActivityFees(this.activityId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActivityFee>?>(
      future: FeeController.getActivityFees(activityId),
      builder:
          (BuildContext context, AsyncSnapshot<List<ActivityFee>?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LinearProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const NotFoundAnimation();
        }

        List<ActivityFee> list = snapshot.data as List<ActivityFee>;
        List<Widget> fees = [];
        for (var fee in list) {
          fees.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(fee.nombre),
              Text(fee.frecuencia.nombre),
              Text("\$${fee.monto}"),
            ],
          ));
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                "Tarifas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...fees
            ],
          ),
        );
      },
    );
  }
}
