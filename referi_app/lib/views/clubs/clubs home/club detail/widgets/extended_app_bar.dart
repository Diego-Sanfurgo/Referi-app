import 'package:flutter/material.dart';

import 'package:referi_app/models/organization.dart';

class ExtendedClubAppBar extends StatelessWidget {
  // final String heroTag;
  final Organization org;
  const ExtendedClubAppBar({Key? key, required this.org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
        backgroundColor: Colors.grey.shade100,
        pinned: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            org.nombre,
            style: const TextStyle(
                color: Colors.white,
                shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
          ),
          background: org.logo != null
              ? Image.network(org.logo!)
              : Image.asset("assets/images/no_image_placeholder.png"),
          // background: Image.asset(
          //   'assets/images/club_regatas_foto.jpg',
          //   fit: BoxFit.fill,
          // ),
          // background: Hero(
          //   tag: heroTag,
          //   child: Image.asset(
          //     'assets/images/club_regatas_foto.jpg',
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ));
  }
}
