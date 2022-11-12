import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/navigation_controller.dart';
import '../../widgets/activity_card.dart';

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
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 10.h),
              child: PageView.builder(
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.8),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                padEnds: false,
                itemBuilder: (context, index) {
                  String imagePath = "assets/images/futbol_regatas.jpg";
                  return SizedBox();

                  // return ActivityCard(
                  //   imagePath: imagePath,
                  //   title: "Futbol 11 juvenil",
                  //   subtitle1: "Club Regatas",
                  // );
                },
              ),
            ),
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
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          const _ClubCard('assets/images/clubs/club_obras.png'),
          const _ClubCard('assets/images/clubs/club_regatas.png'),
          const _ClubCard('assets/images/clubs/club_tomba.png'),
        ]),
      ),
    );
  }
}

class _ClubCard extends StatelessWidget {
  final String imagePath;
  const _ClubCard(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Image.asset(imagePath, fit: BoxFit.contain),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                  height: 10.h,
                  width: double.infinity,
                  child: const ListTile(
                    contentPadding: EdgeInsets.all(8),
                    title: Text(
                      "Club Obras",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Avenida siempre viva S/N",
                      style: TextStyle(color: Colors.white),
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
