import 'package:flutter/material.dart';

class GlobalNavigationState with ChangeNotifier {
  int _page = 1;
  late BuildContext context;
  GlobalKey<NavigatorState>? _bodyNavigatorKey;

  GlobalNavigationState({required this.context});

  int get page => _page;

  set page(int newValue) {
    _page = newValue;
    notifyListeners();
  }

  set navigatorKey(GlobalKey<NavigatorState> newValue) {
    _bodyNavigatorKey = newValue;
  }

  void updateBasedOnRoute() {
    String? currentPath;
    _bodyNavigatorKey!.currentState!.popUntil((route) {
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
