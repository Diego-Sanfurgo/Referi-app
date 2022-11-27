import 'package:flutter/material.dart';
import 'package:referi_app/models/activity.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../../../models/grid_activity.dart';

class SearchActivityAppbar extends StatefulWidget {
  final String activityType;
  const SearchActivityAppbar(this.activityType, {super.key});

  @override
  State<SearchActivityAppbar> createState() => _SearchActivityAppbarState();
}

class _SearchActivityAppbarState extends State<SearchActivityAppbar> {
  var title = const Text("");
  var searchTitle = TextField();
  var switcherWidget = Text("");

  @override
  Widget build(BuildContext context) {
    title = Text(widget.activityType);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: switcherWidget,
    );
  }
}

class SearchTitle extends StatefulWidget {
  const SearchTitle({super.key});

  @override
  State<SearchTitle> createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  @override
  Widget build(BuildContext context) {
    List<Activity> list =
        AppProviders.activityProvider(context).activitiesSearched;
    return TextField(
      decoration: InputDecoration(hintText: "algo"),
      onChanged: (value) {},
    );
  }
}
