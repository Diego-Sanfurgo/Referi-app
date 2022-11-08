import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:referi_app/API/params.dart';

import '../../controllers/activity_controller.dart';
import '../../controllers/navigation_controller.dart';

import '../../models/grid_activity.dart';

class ActivitiesHome extends StatelessWidget {
  const ActivitiesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const AutoSizeText(
                "Actividades",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
                maxFontSize: 26,
                minFontSize: 22,
              ),
            ]),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: _ActivityGrid(),
        ),
      ],
    );
  }
}

class _ActivityGrid extends StatelessWidget {
  const _ActivityGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<GridActivity>>(
        future: ActivityController.obtainActivityTypes(),
        builder: (context, AsyncSnapshot<List<GridActivity>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var activity = snapshot.data![index];

              return _ActivityCard(activity);
            },
          );
        },
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final GridActivity activity;

  const _ActivityCard(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => NavigationController.goToWithArguments(
            Routes.activitySearch,
            args: activity),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(activity.imgUrl, fit: BoxFit.cover),
            Container(color: activity.color),
            Center(
              child: AutoSizeText(
                activity.tipo.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 8,
                      )
                    ]),
                minFontSize: 20,
                maxFontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
