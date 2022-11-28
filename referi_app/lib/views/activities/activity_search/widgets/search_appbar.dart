import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_search_bloc.dart';

class SearchActivityAppbar extends StatefulWidget {
  final String activityType;
  const SearchActivityAppbar(
    this.activityType, {
    super.key,
  });

  @override
  State<SearchActivityAppbar> createState() => _SearchActivityAppbarState();
}

class _SearchActivityAppbarState extends State<SearchActivityAppbar> {
  late Widget switcherWidget;

  @override
  Widget build(BuildContext context) {
    final title = Text(widget.activityType);
    final searchTitle = _SearchTitle(widget.activityType);
    switcherWidget = title;

    return BlocBuilder<ActivitySearchBloc, ActivitySearchState>(
      builder: (context, state) {
        if (state is ActivitySearchInitial) {
          switcherWidget = title;
        }
        if (state is SwitchedAppbarState) {
          switcherWidget = searchTitle;
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switcherWidget,
        );
      },
    );
  }
}

class _SearchTitle extends StatefulWidget {
  final String initialText;
  const _SearchTitle(this.initialText);

  @override
  State<_SearchTitle> createState() => _SearchTitleState();
}

class _SearchTitleState extends State<_SearchTitle> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
    BlocProvider.of<ActivitySearchBloc>(context)
        .add(FilterList(widget.initialText));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: "Actividad",
        border: InputBorder.none,
      ),
      onChanged: (value) =>
          BlocProvider.of<ActivitySearchBloc>(context).add(FilterList(value)),
    );
  }
}
