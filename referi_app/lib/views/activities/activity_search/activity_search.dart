import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/body.dart';
import 'widgets/search_appbar.dart';
import 'bloc/activity_search_bloc.dart';

import '../../../models/activity_type.dart';

class ActivitySearch extends StatelessWidget {
  const ActivitySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivitySearchBloc(),
      child: const _ActivitySearchView(),
    );
  }
}

class _ActivitySearchView extends StatefulWidget {
  const _ActivitySearchView({Key? key}) : super(key: key);

  @override
  State<_ActivitySearchView> createState() => _ActivitySearchViewState();
}

class _ActivitySearchViewState extends State<_ActivitySearchView> {
  @override
  Widget build(BuildContext context) {
    final ActivityType activity =
        ModalRoute.of(context)!.settings.arguments as ActivityType;
    final blocProvider = BlocProvider.of<ActivitySearchBloc>(context);
    bool isSearching = false;

    return WillPopScope(
      onWillPop: () => _onWillPopFunction(blocProvider),
      child: Scaffold(
        appBar: AppBar(
          title: SearchActivityAppbar(activity.tipo),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                isSearching = !isSearching;
                blocProvider.add(SwitchAppbar(isSearching));
              },
            )
          ],
        ),
        body: Body(activity),
      ),
    );
  }
}

Future<bool> _onWillPopFunction(ActivitySearchBloc blocProvider) {
  if (blocProvider.state is ActivitySearchResults) {
    var actualState = blocProvider.state as ActivitySearchResults;

    if (actualState.isSearching) {
      blocProvider.add(ToInitial());
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  } else {
    return Future.value(true);
  }
}
