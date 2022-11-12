import 'package:flutter/material.dart';
import 'package:referi_app/models/activity.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../controllers/navigation_controller.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isCard;
  // final bool isThreeLine;

  const ActivityCard(
    this.activity, {
    Key? key,
    this.isCard = true,
    // this.isThreeLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String subtitle1 = activity.organizacion.nombre;
    final String subtitle2 = activity.turnos.length.toString();

    late final Widget subtitleWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(subtitle1),
        AutoSizeText("$subtitle2 turnos disponibles"),
      ],
    );

    Widget activityTile = InkWell(
      onTap: () => NavigationController.goToWithArguments(Routes.activityDetail,
          args: activity),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
                width: 30.w,
                height: 8.h,
                child: activity.imgUrl != null
                    ? Image.network(activity.imgUrl!, fit: BoxFit.fill)
                    : Image.asset("assets/images/no_image_placeholder.png",
                        fit: BoxFit.fill)),
            SizedBox(
              width: 45.w,
              height: 8.h,
              child: ListTile(
                isThreeLine: true,
                title: AutoSizeText(activity.nombre),
                subtitle: subtitleWidget,visualDensity: VisualDensity.comfortable,
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
