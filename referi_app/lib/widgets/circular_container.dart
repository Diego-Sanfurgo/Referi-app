import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  const CircularContainer({Key? key, required this.child, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? Colors.grey)),
      child: child,
    );
  }
}
