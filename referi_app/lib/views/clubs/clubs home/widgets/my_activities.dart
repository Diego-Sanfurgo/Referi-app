import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/models/enrollment.dart';
import '/controllers/user_controller.dart';
import '/widgets/activities/user_activities.dart';
import '/theme/animations/activities_not_found.dart';

import 'my_activities_placeholder.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({Key? key}) : super(key: key);

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  late final Future<List<Enrollment>> future;

  @override
  void initState() {
    super.initState();
    future = UserController.obtainUserActivities();
  }

  @override
  Widget build(BuildContext context) {
    var activityCards = FutureBuilder<List<Enrollment>>(
      future: future,
      builder:
          (BuildContext context, AsyncSnapshot<List<Enrollment>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MyActivitiesPlaceholder();
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return NotFoundAnimation(size: 10.h);
        }

        return ConstrainedBox(
          constraints: BoxConstraints.expand(height: 10.h),
          child: PageView.builder(
            controller: PageController(initialPage: 0, viewportFraction: 0.8),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            pageSnapping: false,
            itemBuilder: (context, index) {
              return UserActivityCard(snapshot.data![index]);
            },
          ),
        );
      },
    );

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: AutoSizeText(
                "Mis actividades",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
                maxFontSize: 26,
                minFontSize: 22,
              ),
            ),
            activityCards
          ],
        ),
      ),
    );
  }
}
