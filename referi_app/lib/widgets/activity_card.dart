import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../controllers/navigation_controller.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String? subtitle1;
  final String? subtitle2;
  final String imagePath;
  final bool isCard;
  // final bool isThreeLine;

  const ActivityCard({
    Key? key,
    required this.title,
    required this.imagePath,
    this.subtitle1,
    this.subtitle2,
    this.isCard = true,
    // this.isThreeLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget subtitleWidget;
    bool isThreeLine = false;
    if (subtitle2 != null && subtitle1 != null) {
      isThreeLine = true;
      subtitleWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText("$subtitle1"),
          AutoSizeText("($subtitle2)"),
        ],
      );
    } else {
      subtitleWidget = AutoSizeText("$subtitle1");
    }

    Widget activityTile = Row(
      children: [
        SizedBox(
            width: 30.w,
            height: double.infinity,
            child: Image.asset(imagePath, fit: BoxFit.fill)),
        SizedBox(
          width: 45.w,
          height: double.infinity,
          child: ListTile(
            // isThreeLine: isThreeLine,
            // leading: Image.asset(imagePath),
            title: const AutoSizeText("Fútbol 11 Juvenil"),
            subtitle: subtitleWidget,
            onTap: () => NavigationController.goToWithArguments(
                Routes.activityDetail,
                args: imagePath),
          ),
        ),
      ],
    );
    ListTile(
      isThreeLine: isThreeLine,
      leading: Image.asset(imagePath),
      title: const AutoSizeText("Fútbol 11 Juvenil"),
      subtitle: subtitleWidget,
      onTap: () => NavigationController.goToWithArguments(Routes.activityDetail,
          args: imagePath),
    );

    return isCard
        ? Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            clipBehavior: Clip.hardEdge,
            elevation: 5,
            child: activityTile,
          )
        : activityTile;
  }
}
