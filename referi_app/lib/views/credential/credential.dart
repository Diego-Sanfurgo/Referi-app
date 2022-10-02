import 'package:flutter/material.dart';

class CredentialHome extends StatelessWidget {
  const CredentialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Text("Hello CREDENTIAL"),
          ),
        )
      ],
    );
  }
}
