import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'activities_list.dart';
import '../bloc/activity_search_bloc.dart';
import '../../../../models/grid_activity.dart';
import '../../../../theme/animations/activities_not_found.dart';
import '../../../../theme/animations/loading_animation.dart';

class Body extends StatelessWidget {
  final GridActivity activity;
  const Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider.of<ActivitySearchBloc>(context);

    return BlocBuilder<ActivitySearchBloc, ActivitySearchState>(
      buildWhen: (previous, current) {
        if (current is SwitchedAppbarState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state is ActivitySearchInitial) {
          blocProvider.add(ObtainActivitiesByType(activity.id));
          return const LoadingAnimation();
        } else if (state is ActivitySearchResults) {
          return ActivitiesList(state.list);
        } else {
          return const NotFoundAnimation();
        }
      },
    );
  }
}
