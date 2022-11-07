import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:referi_app/controllers/activity_controller.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import '../../models/grid_activity.dart' as gact;

class ActivitiesHome extends StatelessWidget {
  const ActivitiesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const AutoSizeText(
                "Actividades",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
                maxFontSize: 26,
                minFontSize: 22,
              ),
            ]),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: _ActivityGrid(),
        ),
      ],
    );
  }
}

class _ActivityGrid extends StatelessWidget {
  const _ActivityGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ActivityController.obtainActivityTypes(),
      builder: (context, snapshot) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var activity = gact.gridActivities[index];

              return _ActivityCard(
                activityName: activity.name,
                cardColor: activity.color,
                imagePath: activity.imageUrl,
              );
            },
            childCount: 11,
          ),
        );
      },
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String imagePath;
  final String activityName;
  final Color cardColor;
  const _ActivityCard({
    Key? key,
    required this.imagePath,
    required this.activityName,
    required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => NavigationController.goToWithArguments(Routes.activitySearch,
          args: activityName),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(color: cardColor),
            Center(
              child: AutoSizeText(
                activityName.toUpperCase(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                minFontSize: 20,
                maxFontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
