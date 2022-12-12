import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PersonalDataListTile extends StatelessWidget {
  final String title;
  final String value;
  const PersonalDataListTile(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String valueLabel = value == "" ? "Sin ${title.toLowerCase()}" : value;

    return ListTile(
      title: AutoSizeText(
        title,
        maxFontSize: 20,
        minFontSize: 12,
      ),
      subtitle: AutoSizeText(valueLabel, maxFontSize: 16, minFontSize: 10),
    );
  }
}
