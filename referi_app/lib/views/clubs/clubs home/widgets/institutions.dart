import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/models/dto/organization_dto.dart';
import '/controllers/organization_controller.dart';
import '/theme/animations/activities_not_found.dart';

import 'club_card.dart';
import 'clubs_placeholder.dart';

class Institutions extends StatefulWidget {
  const Institutions({Key? key}) : super(key: key);

  @override
  State<Institutions> createState() => _InstitutionsState();
}

class _InstitutionsState extends State<Institutions> {
  late final Future<List<DTOOrganization>> future;
  @override
  void initState() {
    super.initState();
    future = OrganizationController.obtainOrganizations();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    var clubCards = FutureBuilder<List<DTOOrganization>>(
      future: future,
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
