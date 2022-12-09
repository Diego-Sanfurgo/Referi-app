import 'package:flutter/material.dart';

import 'package:expandable_text/expandable_text.dart';

class ActivityDescription extends StatelessWidget {
  // final Activity activity;
  final String? description;

  const ActivityDescription(
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Visibility(
          visible: description != null ? true : false,
          child: ExpandableText(
            description!,
            expandText: "ver más",
            collapseText: "ver menos",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkStyle: const TextStyle(fontWeight: FontWeight.bold),
            style: TextStyle(color: Colors.grey.shade700),
          )),
    );
  }
}
