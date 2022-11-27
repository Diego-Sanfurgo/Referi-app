import 'package:flutter/material.dart';
import 'package:referi_app/models/activity.dart';
import 'package:referi_app/theme/colors.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/navigation_controller.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isCard;
  final String heroId;

  const ActivityCard(
    this.activity, {
    Key? key,
    this.isCard = true,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = {"activity": activity, "tag": heroId};
    final String subtitle1 = activity.organizacion.nombre;
    final int subtitle2 = activity.turnos.length;

    late final Widget subtitleWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          subtitle1,
          maxFontSize: 14,
          minFontSize: 10,
        ),
        AutoSizeText(
          subtitle2 == 1
              ? "$subtitle2 turno disponible"
              : "$subtitle2 turnos disponibles",
          maxFontSize: 14,
          minFontSize: 10,
        ),
      ],
    );

    Widget activityTile = InkWell(
      onTap: () => NavigationController.goToWithArguments(Routes.activityDetail,
          args: args),
      child: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: primary.shade700))),
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size.fromHeight(10.h)),
          child: Row(
            children: [
              SizedBox(
                  width: 30.w,
                  height: double.infinity,
                  child: activity.imgUrl != null
                      ? Hero(
                          tag: heroId,
                          child:
                              Image.network(activity.imgUrl!, fit: BoxFit.fill))
                      : Image.asset("assets/images/no_image_placeholder.png",
                          fit: BoxFit.fill)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(activity.nombre,
                        maxFontSize: 20,
                        minFontSize: 16,
                        maxLines: 2,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitleWidget
                  ],
                ),
              ),
            ],
          ),
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
