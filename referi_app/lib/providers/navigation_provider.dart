import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final ValueNotifier<int> _navbarIndex = ValueNotifier<int>(0);
  ValueNotifier<int> get navbarIndex => _navbarIndex;
  setNavbarIndex(int value) => _navbarIndex.value = value;

  final ValueNotifier<int> _unreadAmount = ValueNotifier<int>(0);
  ValueNotifier<int> get unreadAmount => _unreadAmount;
  setUnreadAmount(int value) => _unreadAmount.value = value;
}
