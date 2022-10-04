import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CredentialDetail extends StatelessWidget {
  const CredentialDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credenciales"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText(
                  "Club Regatas",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxFontSize: 22,
                  minFontSize: 16,
                ),
                Image.asset('assets/images/perfil_prueba.png'),
                SizedBox(height: 32),
                _CredentialData()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CredentialData extends StatelessWidget {
  const _CredentialData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(credentialFillData.keys.elementAt(index)),
          subtitle: Text(credentialFillData.values.elementAt(index)),
        );
      },
    );
  }
}

Map<String, String> get credentialFillData => {
      "Nombre y apellido": "Diego Sanfurgo",
      "DNI": "41363675",
      "Validez hasta": "4/11/2022",
      "Estado": "Activo",
    };
