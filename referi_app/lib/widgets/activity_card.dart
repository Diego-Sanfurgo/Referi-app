import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../controllers/navigation_controller.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String? subtitle1;
  final String? subtitle2;
  final String? imagePath;
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
    late final Widget? subtitleWidget;
    List<Widget> subtitles = [];
    bool isThreeLine = false;

    if (subtitle1 != null) {
      subtitles.add(AutoSizeText("$subtitle1"));
    }
    if (subtitle2 != null) {
      subtitles.add(AutoSizeText("$subtitle2"));
    }

    if (subtitles.length == 2) {
      isThreeLine = true;
      subtitleWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText("$subtitle1"),
          AutoSizeText("$subtitle2 turnos disponibles"),
        ],
      );
    } else if (subtitles.length == 1) {
      subtitleWidget = AutoSizeText("$subtitle1");
    } else {
      subtitleWidget = null;
    }

    Widget activityTile = InkWell(
      onTap: () => NavigationController.goToWithArguments(Routes.activityDetail,
          args: imagePath),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
                width: 30.w,
                height: 8.h,
                child: imagePath != null
                    ? Image.network(imagePath!, fit: BoxFit.fill)
                    : Image.asset("assets/images/no_image_placeholder.png",
                        fit: BoxFit.fill)),
            SizedBox(
              width: 45.w,
              height: 8.h,
              child: ListTile(
                isThreeLine: isThreeLine,
                title: AutoSizeText(title),
                subtitle: subtitleWidget,
              ),
            ),
          ],
        ),
      ),
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
