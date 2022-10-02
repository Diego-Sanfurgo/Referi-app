import 'package:flutter/material.dart';

import 'package:referi_app/theme/colors.dart' as colors;

class TileLeadingIcon extends StatelessWidget {
  final Color? color;
  final IconData icon;
  const TileLeadingIcon(this.icon, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? colors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white));
  }
}
