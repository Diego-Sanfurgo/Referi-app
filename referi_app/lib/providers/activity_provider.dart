import 'package:flutter/cupertino.dart';

import '../../models/activity.dart';

class ActivityProvider extends ChangeNotifier {
  // final Set<Activity> _activitySearched = {};
  List<Activity> _activitiesSearched = [];
  final ValueNotifier<bool> activityDetailFlag = ValueNotifier<bool>(false);
  final Set<Map<String, String>> _timeRangesSelected = {};

  // Set<Activity> get activitySearched => _activitySearched;
  List<Activity> get activitiesSearched => _activitiesSearched;
  Set<Map<String, String>> get timeRangesSelected => _timeRangesSelected;
  ValueNotifier<bool> get activeFlag => activityDetailFlag;

  // void addActivityToSearchedList(Activity activity) {
  //   _activitySearched.add(activity);
  //   notifyListeners();
  // }

  void setActivitiesSearchedList(List<Activity> list) {
    _activitiesSearched = list;
    notifyListeners();
  }

  setActiveFlagValue(bool value) {
    activityDetailFlag.value = value;
    notifyListeners();
  }

  addTimeRange(String turnoId, String label) {
    _timeRangesSelected.add({turnoId: label});
    activityDetailFlag.value = true;
    notifyListeners();
  }

  deleteTimeRange(String id) {
    // _timeRangesSelected.remove(id);
    _timeRangesSelected.removeWhere((element) => element.keys.first == id);

    if (_timeRangesSelected.isEmpty) {
      activityDetailFlag.value = false;
    }
    notifyListeners();
  }

  clearTimeRanges() {
    _timeRangesSelected.clear();
    activityDetailFlag.value = false;
    notifyListeners();
  }
}
