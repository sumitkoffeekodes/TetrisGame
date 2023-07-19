import 'package:flutter/material.dart';
import 'package:tetris/provider/themes.dart';
import 'package:tetris/values/appColors.dart';

class ColorThemes{

  static  Color getColorForTheme(ThemeColor themeColor) {
    switch (themeColor) {
      case ThemeColor.Blue:
        return AppColors.color66;
      case ThemeColor.Yellow:
        return AppColors.yellow;
      case ThemeColor.Green:
        return AppColors.color4E;
      case ThemeColor.Purple:
        return AppColors.colorA3;
      case ThemeColor.Orange:
        return AppColors.orange;
      case ThemeColor.Grey:
        return AppColors.color28;
      case ThemeColor.Red:
        return AppColors.color1C;
      case ThemeColor.Pink:
        return AppColors.colorBF;
      case ThemeColor.Silver:
        return AppColors.color99;
      default:
        return AppColors.white;
    }
  }


}