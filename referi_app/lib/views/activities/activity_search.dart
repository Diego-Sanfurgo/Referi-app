import 'package:flutter/material.dart';

import '../../models/activity.dart';
import '../../models/grid_activity.dart';
import '../../controllers/activity_controller.dart';

import '../../widgets/activity_card.dart';
import '../../theme/colors.dart' as colors;
import '../../theme/animations/loading_animation.dart';
import '../../theme/animations/activities_not_found.dart';

class ActivitySearch extends StatelessWidget {
  const ActivitySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GridActivity activity =
        ModalRoute.of(context)!.settings.arguments as GridActivity;
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.tipo),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: _Body(activity),
    );
  }
}

class _Body extends StatelessWidget {
  final GridActivity activity;
  const _Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: FutureBuilder<List<Activity>?>(
          future: ActivityController.obtainActivitiesByType(activity.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingAnimation();
            }

            if (!snapshot.hasData) {
              return const NotFoundAnimation();
            }
            return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) {
                  Activity activity = snapshot.data[index];
                  String imagePath = "assets/images/futbol_regatas.jpg";

                  return ActivityCard(
                    imagePath: imagePath,
                    title: "Actividad",
                    subtitle1: "Club Regatas",
                    subtitle2: "9h a 12h",
                    isCard: false,
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(height: 1, color: colors.primary.shade800),
                itemCount: 10);
          }),
    );
  }
}
