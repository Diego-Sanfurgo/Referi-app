import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  ValueNotifier<int> _navbarIndex = ValueNotifier<int>(0);

  ValueNotifier<int> get navbarIndex => _navbarIndex;

  setNavbarIndex(int value) => _navbarIndex.value = value;
}
