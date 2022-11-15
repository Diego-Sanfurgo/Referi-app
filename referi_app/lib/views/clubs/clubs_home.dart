import 'package:flutter/material.dart';
import 'package:referi_app/widgets/activities/user_activities.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../models/activity.dart';
import '../../controllers/user_controller.dart';
import '../../models/enrollment.dart';
import '../../theme/animations/activities_not_found.dart';

import '../../models/organization.dart';
import '../../widgets/activities/activity_card.dart';
import '../../controllers/navigation_controller.dart';
import '../../controllers/organization_controller.dart';

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
          return const Center(child: LinearProgressIndicator());
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
            padEnds: false,
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
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: FutureBuilder<List<Organization>>(
          future: OrganizationController.obtainOrganizations(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Organization>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return NotFoundAnimation(size: 10.h);
            }
            List<Widget> list = [];

            for (var organization in snapshot.data!) {
              list.add(_ClubCard(organization));
            }
            return Column(children: [
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
              ...list
            ]);
          },
        ),
      ),
    );
  }
}

class _ClubCard extends StatelessWidget {
  final Organization organization;
  const _ClubCard(this.organization, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget imageLogo;
    try {
      imageLogo = Image.network(
        organization.logo!,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Image.asset(
            "assets/images/no_image_placeholder.png",
            fit: BoxFit.fill),
      );
    } catch (e) {
      imageLogo = Image.asset("assets/images/no_image_placeholder.png",
          fit: BoxFit.fill);
    }

    return Container(
      width: double.infinity,
      height: 30.h,
      margin: const EdgeInsets.only(top: 16),
      child: InkWell(
        onTap: () => NavigationController.goTo(Routes.clubDetail),
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.black)),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              imageLogo,
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                  height: 10.h,
                  width: double.infinity,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    title: Text(
                      organization.nombre,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "${organization.direccion!.calle} ${organization.direccion!.numero}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
