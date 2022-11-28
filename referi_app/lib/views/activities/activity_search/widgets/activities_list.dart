import 'package:flutter/material.dart';

import '../../../../models/activity.dart';
import '../../../../widgets/activities/activity_card.dart';
import '../../../../theme/animations/activities_not_found.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> list;
  const ActivitiesList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const NotFoundAnimation();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: list.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          Activity activity = list[index];

          return ActivityCard(
            activity,
            isCard: false,
            heroId: "$index-img",
          );
        },
      ),
    );
  }
}
