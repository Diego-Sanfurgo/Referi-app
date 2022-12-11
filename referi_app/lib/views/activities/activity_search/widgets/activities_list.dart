import 'package:flutter/material.dart';
import 'package:referi_app/models/dto/activity_dto.dart';

import '/widgets/activities/activity_card.dart';
import '/theme/animations/activities_not_found.dart';

class ActivitiesList extends StatelessWidget {
  final List<DTOActivity> list;
  const ActivitiesList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const NotFoundAnimation();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        DTOActivity activity = list[index];

        return ActivityCard(
          activity,
          isCard: false,
          heroId: "$index-img",
        );
      },
    );
  }
}
