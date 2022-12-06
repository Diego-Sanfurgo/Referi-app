import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

class MyActivitiesPlaceholder extends StatelessWidget {
  const MyActivitiesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRect(child: Container(width: 80.w, color: Colors.white)),
            const SizedBox(width: 16),
            ClipRect(child: Container(width: 10.w, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
