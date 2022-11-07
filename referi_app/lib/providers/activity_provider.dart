import 'package:flutter/cupertino.dart';
import 'package:referi_app/models/grid_activity.dart';

class ActivityProvider extends ChangeNotifier {
  final List<GridActivity> _gridActivityList = [];

  List<GridActivity> get gridActivityList => _gridActivityList;

  void addActivityToGridActivityList(GridActivity activity) {
    _gridActivityList.add(activity);
    notifyListeners();
  }
}
