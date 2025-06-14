import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkTheme;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }
}
