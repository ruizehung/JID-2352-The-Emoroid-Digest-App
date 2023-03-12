import 'package:flutter/material.dart';

class BottomNavBarState with ChangeNotifier {
  int _page = 1;
  GlobalKey<NavigatorState>? _navigatorKey;

  int get page => _page;

  set page(int newValue) {
    _page = newValue;
    notifyListeners();
  }

  set navigatorKey(GlobalKey<NavigatorState> newValue) {
    _navigatorKey = newValue;
  }

  void updateBasedOnRoute() {
    String? currentPath;
    _navigatorKey!.currentState!.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });
    if (currentPath!.startsWith("/visual-summary")) {
      _page = 0;
    } else if (currentPath == "/home" || currentPath == "/search" || currentPath == "/notification") {
      _page = 1;
    } else if (currentPath!.startsWith("/podcast")) {
      _page = 2;
    } else {
      _page = 1;
    }
    notifyListeners();
  }
}
