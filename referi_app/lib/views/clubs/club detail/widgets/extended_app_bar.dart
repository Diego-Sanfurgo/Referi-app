import 'package:flutter/material.dart';

import '/theme/colors.dart';
import '/models/dto/organization_dto.dart';

class ExtendedClubAppBar extends StatelessWidget {
  // final String heroTag;
  final DTOOrganization org;
  const ExtendedClubAppBar({Key? key, required this.org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
        backgroundColor: Colors.grey.shade100,
        iconTheme: IconThemeData(color: primary),
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            org.nombre!,
            style: const TextStyle(
                color: Colors.white,
                shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
          ),
          background: org.logo != null
              ? Image.network(
                  org.logo!,
                  fit: BoxFit.fill,
                )
              : Image.asset("assets/images/no_image_placeholder.png"),
        ));
  }
}
