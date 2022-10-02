import 'package:flutter/material.dart';

class ClubsHome extends StatelessWidget {
  const ClubsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Text("Hello CLUBS"),
          ),
        )
      ],
    );
  }
}
