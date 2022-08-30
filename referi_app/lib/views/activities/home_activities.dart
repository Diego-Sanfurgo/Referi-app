import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class HomeActivities extends StatelessWidget {
  const HomeActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AutoSizeText(
    //         "Actividades",
    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    //       ),
    //       SizedBox(height: 24),
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: 11,
      itemBuilder: (BuildContext context, int index) {
        return const _ActivityCard();
      },
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/gim.jpg",
              fit: BoxFit.cover,
            ),
            Container(
              color: const Color.fromRGBO(171, 108, 252, 0.4),
            ),
            Center(
              child: AutoSizeText(
                "Gimnasio".toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                minFontSize: 14,
                maxFontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
