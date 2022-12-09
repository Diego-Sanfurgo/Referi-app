import 'package:flutter/material.dart';

import '/providers/app_providers.dart';
import '/models/dto/activity_dto.dart';
import '/controllers/activity_controller.dart';
import '/controllers/navigation_controller.dart';

import 'widgets/fees.dart';
import 'widgets/header.dart';
import 'widgets/time_ranges.dart';

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final activity = args["activity"];
    final heroTag = args["tag"];

    return WillPopScope(
      onWillPop: () {
        ActivityController.clearTimeRange();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Detalle de actividad")),
        body: _Body(activity, heroTag),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  // final Activity activity;
  final DTOActivity activity;
  final String heroTag;

  const _Body(this.activity, this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget actionBtn = ValueListenableBuilder(
      valueListenable: AppProviders.activityProvider(context).activeFlag,
      builder: (BuildContext context, bool value, Widget? child) {
        return ElevatedButton(
            onPressed: value
                ? () => NavigationController.goToWithArguments(
                    Routes.activityPayment,
                    args: activity)
                : null,
            child: const Text("INSCRIBIRSE"));
      },
    );
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                ActivityDetailHeader(activity, heroTag),
                TimeRanges(activity.turnos!),
                Fees(activity.tarifas!),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [actionBtn, const SizedBox(height: 40)],
              )),
        ),
      ],
    );
  }
}
