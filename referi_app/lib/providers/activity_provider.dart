import 'package:flutter/cupertino.dart';
import 'package:referi_app/models/activity.dart';
import 'package:referi_app/models/grid_activity.dart';

class ActivityProvider extends ChangeNotifier {
  final List<GridActivity> _gridActivityList = gridActivities;
  final Set<Activity> _activitySearched = {};

  Set<GridActivity> get gridActivityList => _gridActivityList.toSet();
  Set<Activity> get activitySearched => _activitySearched;

  void addActivityToGridActivityList(GridActivity activity) {
    _gridActivityList.insert(0, activity);
    notifyListeners();
  }

  void addActivityToSearchedList(Activity activity) {
    _activitySearched.add(activity);
    notifyListeners();
  }
}
