import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import '../../controllers/navigation_controller.dart';

import '../../theme/colors.dart' as colors;

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
          return const _ActivityCard();
        },
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: colors.primary.shade800),
        itemCount: 10);
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/futbol_regatas.jpg";
    return ListTile(
      isThreeLine: true,
      leading: Image.asset(imagePath),
      title: const AutoSizeText("Actividad"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AutoSizeText("Club REGATAS"),
          AutoSizeText("Todos los dias (9hs a 12hs)"),
        ],
      ),
      onTap: () => NavigationController.goToWithArguments(Routes.activityDetail,
          args: imagePath),
    );
  }
}
