import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/Theme.dart';

class ThemeProvider extends ChangeNotifier {
  // Default theme is set to lightTheme for consistency
  ThemeData _themeData = lightTheme;

  // Getter for the current theme data
  ThemeData get themeData => _themeData;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    _themeData = _themeData == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }
}
