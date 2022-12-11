import 'package:flutter/material.dart';
import 'package:referi_app/models/dto/organization_dto.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable_text/expandable_text.dart';

import '/models/enrollment.dart';
import 'package:referi_app/theme/colors.dart' as colors;
import '/controllers/navigation_controller.dart';

class HeaderActivity extends StatelessWidget {
  final Enrollment enrollment;
  const HeaderActivity(this.enrollment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DTOOrganization org =
        DTOOrganization.fromJson(enrollment.organizacion.toJson());

    var activity = enrollment.turnoActividad.actividad;

    Widget nameAndInstitute = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            activity.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxFontSize: 22,
            minFontSize: 18,
          ),
          GestureDetector(
            onTap: () => NavigationController.goToWithArguments(
                Routes.clubDetail,
                args: org),
            child: AutoSizeText(
              enrollment.organizacion.nombre,
              style: TextStyle(color: colors.secondaryDark),
              maxFontSize: 16,
              minFontSize: 12,
            ),
          ),
        ],
      ),
    );
    Widget activityDescription = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Visibility(
          visible: activity.descripcion != null ? true : false,
          child: ExpandableText(
            activity.descripcion!,
            expandText: "ver más",
            collapseText: "ver menos",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkStyle: const TextStyle(fontWeight: FontWeight.bold),
            style: TextStyle(color: Colors.grey.shade700),
          )),
    );

    Widget activityImage = Container(
      padding: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: activity.imgUrl != null
          ? Image.network(
              activity.imgUrl!,
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
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
                nameAndInstitute,
                activityDescription,
              ],
            ),
          )
        ],
      ),
    );
  }
}
