import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../models/activity.dart';
import '../../models/grid_activity.dart';
import '../../controllers/activity_controller.dart';

import '../../theme/colors.dart' as colors;
import '../../utils/network_assets_urls.dart';
import '../../widgets/activity_card.dart';

class ActivitySearch extends StatelessWidget {
  const ActivitySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GridActivity activity =
        ModalRoute.of(context)!.settings.arguments as GridActivity;
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.tipo),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: _Body(activity),
    );
  }
}

class _Body extends StatelessWidget {
  final GridActivity activity;
  const _Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: FutureBuilder<List<Activity>?>(
          future: ActivityController.obtainActivitiesByType(activity.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingAnimation();
            }

            if (!snapshot.hasData) {
              return const NotFoundAnimation();
            }
            return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) {
                  Activity activity = snapshot.data[index];
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
          }),
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = 35.w;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.network(
            NetworkAssets.loadingChangingBall,
            width: widthAndHeight,
            height: widthAndHeight,
          ),
          const SizedBox(height: 32),
          const AutoSizeText("Buscando actividades...",
              minFontSize: 18, maxFontSize: 24)
        ],
      ),
    );
  }
}

class NotFoundAnimation extends StatelessWidget {
  const NotFoundAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = 50.w;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.network(
            NetworkAssets.noDataFound,
            width: widthAndHeight,
            height: widthAndHeight,
            repeat: false,
          ),
          const SizedBox(height: 16),
          const AutoSizeText("No encontramos actividades :(",
              minFontSize: 18, maxFontSize: 24)
        ],
      ),
    );
  }
}
