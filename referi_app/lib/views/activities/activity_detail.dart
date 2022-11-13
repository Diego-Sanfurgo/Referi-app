import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../models/activity.dart';
import '../../theme/colors.dart' as colors;
import '../../controllers/navigation_controller.dart';

import '../../widgets/activities/fees.dart';
import '../../widgets/activities/time_ranges.dart';

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activity = ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de actividad")),
      body: _Body(activity),
    );
  }
}

class _Body extends StatelessWidget {
  final Activity activity;
  const _Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                _HeaderActivity(activity),
                TimeRanges(activity.turnos),
                Fees(activity.tarifas),
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
                children: [
                  ElevatedButton(
                      onPressed: () => NavigationController.goToWithArguments(
                          Routes.activityPayment,
                          args: activity),
                      child: const Text("INSCRIBIRSE")),
                ],
              )),
        ),
      ],
    );
  }
}

class _HeaderActivity extends StatelessWidget {
  final Activity activity;
  const _HeaderActivity(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              activity.organizacion.nombre,
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
            expandOnTextTap: true,
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
