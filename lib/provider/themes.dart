import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


enum ThemeColor {
  Blue,
  Yellow,
  Green,
  Purple,
  Orange,
  Grey,
  Red,
  Pink,
  Silver,
  White,
}

class Themestyles {
  static ThemeData themeData(ThemeColor themeColor, BuildContext context) {
    Color? primaryColor;
    Color? backgroundColor;
    // Assign color values based on the selected themeColor

    return ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      // Set other color properties accordingly
    );
  }
}

class ThemePreference {
  static const THEME_COLOR = "THEMECOLOR";

  setThemeColor(ThemeColor color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(THEME_COLOR, color.index);
  }

  Future<ThemeColor> getThemeColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final colorIndex = prefs.getInt(THEME_COLOR) ?? ThemeColor.White.index;
    return ThemeColor.values[colorIndex];
  }
}

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  ThemeColor _themeColor = ThemeColor.White;

  ThemeColor get themeColor => _themeColor;

  set themeColor(ThemeColor value) {
    _themeColor = value;
    themePreference.setThemeColor(value);
    notifyListeners();
  }

  initializeTheme() async {
    _themeColor = await themePreference.getThemeColor();
    notifyListeners();
  }
}

