import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ActivityHomePlaceholder extends StatelessWidget {
  const ActivityHomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      children: List.generate(
          11,
          (index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              )),
    );
  }
}
