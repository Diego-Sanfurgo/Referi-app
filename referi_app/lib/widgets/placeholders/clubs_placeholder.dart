import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

class ClubsPlaceholder extends StatelessWidget {
  const ClubsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: List.generate(
            3,
            (_) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.white,
              height: 30.h,
            ),
          ),
        ));
  }
}
