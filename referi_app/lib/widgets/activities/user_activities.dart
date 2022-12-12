import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/theme/colors.dart';
import '/models/enrollment.dart';
import '/controllers/navigation_controller.dart';

class UserActivityCard extends StatelessWidget {
  final Enrollment enrollment;

  const UserActivityCard(
    this.enrollment, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget textColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40.w,
          child: AutoSizeText(enrollment.turnoActividad.actividad.nombre,
              maxFontSize: 20,
              minFontSize: 16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        AutoSizeText(
          enrollment.organizacion.nombre,
          maxFontSize: 14,
          minFontSize: 10,
        )
      ],
    );

    Widget activityTile = InkWell(
      onTap: () => NavigationController.goToWithArguments(
          Routes.activityDetailEnrolled,
          args: enrollment),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size.fromHeight(10.h)),
        child: Row(
          children: [
            SizedBox(
                width: 30.w,
                height: double.infinity,
                child: enrollment.turnoActividad.actividad.imgUrl != null
                    ? Image.network(enrollment.turnoActividad.actividad.imgUrl!,
                        fit: BoxFit.fill)
                    : Image.asset("assets/images/no_image_placeholder.png",
                        fit: BoxFit.fill)),
            Padding(padding: const EdgeInsets.all(8), child: textColumn),
          ],
        ),
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.black87, width: 0.2)),
      clipBehavior: Clip.hardEdge,
      color: primary.shade50,
      elevation: 5,
      margin: const EdgeInsets.only(right: 16),
      child: activityTile,
    );
  }
}
