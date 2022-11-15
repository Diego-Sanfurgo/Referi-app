import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/widgets/activities/activity_card.dart';
import 'package:referi_app/theme/colors.dart' as colors;

class ClubDetail extends StatelessWidget {
  const ClubDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _ExtendedClubAppBar extends StatelessWidget {
  const _ExtendedClubAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 128,
        pinned: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: FlexibleSpaceBar(
          title: const Text(
            "Club Regatas",
            style: TextStyle(color: Colors.white),
          ),
          background: Image.asset(
            'assets/images/club_regatas_foto.jpg',
            fit: BoxFit.fill,
          ),
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _ExtendedClubAppBar(),
        SliverToBoxAdapter(
            child: ListTile(
          onTap: () {},
          leading: Icon(Icons.location_pin, color: colors.secondary),
          title: const Text("Av. Boulogne Sur Mer 302, Mendoza"),
          visualDensity: VisualDensity.compact,
        )),
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          sliver: SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "En Regatas mantenemos la convicción de forjar nobles deportistas y personas de bien, utilizando el deporte como una herramienta para afianzar la personalidad, sabiendo que lo más importante,no es superar a los demás, sino de superarse a sí mismo.",
              textAlign: TextAlign.center,
            ),
          )),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: AutoSizeText(
              "Actividades del club",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
              maxFontSize: 26,
              minFontSize: 22,
            ),
          ),
        ),
        const _ClubActivities()
      ],
    );
  }
}

class _ClubActivities extends StatelessWidget {
  const _ClubActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String imagePath = "assets/images/futbol_regatas.jpg";

            return Column(
              children: [
                // ActivityCard(
                //   title: "Hockey femenino",
                //   imagePath: imagePath,
                //   isCard: false,
                // ),
                Divider(
                  color: colors.primary,
                  height: 8,
                ),
              ],
            );
          },
          childCount: 10,
        ),
      ),
    );
  }
}
