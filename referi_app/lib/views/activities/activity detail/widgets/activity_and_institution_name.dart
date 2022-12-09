import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/theme/colors.dart' as colors;
import 'package:referi_app/controllers/navigation_controller.dart';

class NameAndInstitution extends StatelessWidget {
  // final Activity activity;
  final String activityName;
  final String orgName;
  const NameAndInstitution(
      {Key? key, required this.activityName, required this.orgName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            activityName,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxFontSize: 22,
            minFontSize: 18,
          ),
          GestureDetector(
            onTap: () => NavigationController.goTo(Routes.clubDetail),
            child: AutoSizeText(
              orgName,
              style: TextStyle(color: colors.secondaryDark),
              maxFontSize: 16,
              minFontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
