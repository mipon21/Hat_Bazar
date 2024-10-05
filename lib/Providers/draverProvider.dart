import 'package:flutter/material.dart';
import 'package:hat_bazar/Pages/Category/CategoryPage.dart';
import 'package:hat_bazar/Pages/Coupon/CouponPage.dart';
import 'package:hat_bazar/Pages/Dashboard/Dashboard.dart';
import 'package:hat_bazar/Pages/Product/ProductPage.dart';
import 'package:hat_bazar/Pages/Settings/SettingsPage.dart';

class DrawerProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  var pages = [
    Dashboard(),
    ProductPage(),
    CategoryPage(),
    CouponPage(),
    SettingsPage(),
  ];

  void selectMenu(int index) {
    _selectedPageIndex = index;
    notifyListeners(); // Notify listeners to update the UI
  }
}
