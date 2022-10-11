import 'package:flutter/material.dart';

import '../../theme/colors.dart' as colors;
import '../../widgets/activity_card.dart';

class ActivitySearch extends StatelessWidget {
  const ActivitySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sectionTitle = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          String imagePath = "assets/images/futbol_regatas.jpg";

          return ActivityCard(
            imagePath: imagePath,
            title: "Actividad",
            subtitle1: "Club Regatas",
            subtitle2: "9h a 12h",
            isCard: false,
          );
        },
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: colors.primary.shade800),
        itemCount: 10);
  }
}
