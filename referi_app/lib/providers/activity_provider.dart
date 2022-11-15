import 'package:flutter/cupertino.dart';

import '../../models/activity.dart';

class ActivityProvider extends ChangeNotifier {
  final Set<Activity> _activitySearched = {};
  final ValueNotifier<bool> _activeFlag = ValueNotifier<bool>(false);

  Set<Activity> get activitySearched => _activitySearched;
  ValueNotifier<bool> get activeFlag => _activeFlag;

  void addActivityToSearchedList(Activity activity) {
    _activitySearched.add(activity);
    notifyListeners();
  }

  setActiveFlagValue(bool value) {
    _activeFlag.value = value;
    notifyListeners();
  }
}
