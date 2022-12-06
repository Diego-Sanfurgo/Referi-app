import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'widgets/extended_app_bar.dart';
import 'package:referi_app/models/organization.dart';
import 'package:referi_app/theme/colors.dart' as colors;

class ClubDetail extends StatelessWidget {
  const ClubDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Organization org =
        ModalRoute.of(context)?.settings.arguments as Organization;
    return Scaffold(
      body: _Body(org),
    );
  }
}

class _Body extends StatelessWidget {
  final Organization org;
  const _Body(this.org, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String heroTag = map["tag"];
    // final Organization org = map["org"];

    return CustomScrollView(
      slivers: [
        ExtendedClubAppBar(org: org),
        SliverToBoxAdapter(
            child: ListTile(
          onTap: () {},
          leading: Icon(Icons.location_pin, color: colors.secondary),
          // title: const Text("Av. Boulogne Sur Mer 302, Mendoza"),
          title: Text(
              "${org.direccion?.calle} ${org.direccion?.numero}, ${org.direccion?.ciudad}"),
          visualDensity: VisualDensity.compact,
        )),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          sliver: SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8),
            // child: Text(
            //   "En Regatas mantenemos la convicción de forjar nobles deportistas y personas de bien, utilizando el deporte como una herramienta para afianzar la personalidad, sabiendo que lo más importante,no es superar a los demás, sino de superarse a sí mismo.",
            child: org.descripcion != null
                ? Text(
                    org.descripcion as String,
                    textAlign: TextAlign.center,
                  )
                : null,
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
