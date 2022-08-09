import 'package:flutter/material.dart';
import 'package:referi_app/styles/colors.dart' as colors;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: const Text("Hola Diego"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_rounded))
        ],
      ),
    );
  }
}
