import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/models/enrollment.dart';
import '/models/dto/organization_dto.dart';
import '/controllers/user_controller.dart';
import '/controllers/organization_controller.dart';
import '/theme/animations/activities_not_found.dart';

import '/widgets/activities/user_activities.dart';

import 'widgets/club_card.dart';
import 'widgets/clubs_placeholder.dart';
import 'widgets/my_activities_placeholder.dart';

class ClubsHome extends StatelessWidget {
  const ClubsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [_MyActivities(), _Institutions()],
    );
  }
}

class _MyActivities extends StatelessWidget {
  const _MyActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activityCards = FutureBuilder<List<Enrollment>>(
      future: UserController.obtainUserActivities(),
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

class _Institutions extends StatelessWidget {
  const _Institutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clubCards = FutureBuilder<List<DTOOrganization>>(
      future: OrganizationController.obtainOrganizations(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DTOOrganization>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const ClubsPlaceholder();
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return NotFoundAnimation(size: 10.h);
        }
        List<Widget> list = [];

        for (var i = 0; i < snapshot.data!.length; i++) {
          list.add(ClubCard(
            snapshot.data![i],
            heroKey: "$i-img",
          ));
        }

        return Column(children: list);
      },
    );
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: AutoSizeText(
              "Clubes y gimnasios",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
              maxFontSize: 26,
              minFontSize: 22,
            ),
          ),
          clubCards
        ]),
      ),
    );
  }
}
