import 'package:flutter/cupertino.dart';

import '../../models/activity.dart';

class ActivityProvider extends ChangeNotifier {
  final Set<Activity> _activitySearched = {};

  Set<Activity> get activitySearched => _activitySearched;


  void addActivityToSearchedList(Activity activity) {
    _activitySearched.add(activity);
    notifyListeners();
  }
}
