import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/models/activity_type.dart';
import '/controllers/navigation_controller.dart';

class ActivityTypeCard extends StatelessWidget {
  final ActivityType gridActivity;

  const ActivityTypeCard(this.gridActivity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => NavigationController.goToWithArguments(
            Routes.activitySearch,
            args: gridActivity),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(gridActivity.imgUrl!, fit: BoxFit.cover),
            Container(color: gridActivity.color),
            Center(
              child: AutoSizeText(
                gridActivity.tipo.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 8,
                      )
                    ]),
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
