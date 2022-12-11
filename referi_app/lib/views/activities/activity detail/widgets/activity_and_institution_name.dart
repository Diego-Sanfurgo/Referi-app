import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/theme/colors.dart' as colors;
import '/models/dto/organization_dto.dart';
import '/controllers/navigation_controller.dart';

class NameAndInstitution extends StatelessWidget {
  final String activityName;
  final DTOOrganization org;

  const NameAndInstitution(
      {Key? key, required this.activityName, required this.org})
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
            onTap: () => NavigationController.goToWithArguments(
                Routes.clubDetail,
                args: org),
            child: AutoSizeText(
              org.nombre!,
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
