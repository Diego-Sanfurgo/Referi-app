import 'package:flutter/material.dart';

import 'widgets/institutions.dart';
import 'widgets/my_activities.dart';

class ClubsHome extends StatelessWidget {
  const ClubsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [MyActivities(), Institutions()],
    );
  }
}
