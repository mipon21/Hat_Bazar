import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  void selectMenu(int index) {
    _selectedPageIndex = index;
    notifyListeners(); // Notify listeners to update the UI
  }
}
