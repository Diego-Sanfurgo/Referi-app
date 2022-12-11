import 'package:flutter/material.dart';
import 'package:referi_app/models/dto/activity_dto.dart';

import 'package:sizer/sizer.dart';

import 'activity_description.dart';
import 'activity_and_institution_name.dart';

class ActivityDetailHeader extends StatelessWidget {
  final DTOActivity activity;
  final String heroTag;
  const ActivityDetailHeader(this.activity, this.heroTag, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget activityImage = Container(
      padding: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: activity.imgUrl != null
          ? Hero(
              tag: heroTag,
              child: Image.network(
                activity.imgUrl!,
                fit: BoxFit.fill,
                width: 100.w,
                height: 25.h,
              ),
            )
          : Image.asset(
              "assets/images/no_image_placeholder.png",
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
            ),
    );

    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          activityImage,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameAndInstitution(
                    activityName: activity.nombre!,
                    org: activity.organizacion!),
                ActivityDescription(activity.descripcion),
              ],
            ),
          )
        ],
      ),
    );
  }
}
