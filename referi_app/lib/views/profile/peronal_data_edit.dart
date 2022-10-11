import 'package:flutter/material.dart';
import 'package:referi_app/theme/colors.dart';

class PersonalDataEdit extends StatelessWidget {
  const PersonalDataEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edición de datos personales"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverPadding(
    //       padding: EdgeInsets.all(16),
    //       sliver: SliverToBoxAdapter(
    //         child: ListView.separated(
    //           itemBuilder: (context, index) {
    //             return TextFormField();
    //           },
    //           separatorBuilder: (context, index) => const SizedBox(height: 32),
    //           itemCount: 6,
    //         ),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Column(
    //         children: [
    //           ElevatedButton(onPressed: () {}, child: Text("Guardar cambios")),
    //           OutlinedButton(onPressed: () {}, child: Text("Cancelar"))
    //         ],
    //       ),
    //     )
    //   ],
    // );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return TextFormField();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              itemCount: 6,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Guardar cambios")),
          OutlinedButton(onPressed: () {}, child: Text("Cancelar"))
        ],
      ),
    );
  }
}
