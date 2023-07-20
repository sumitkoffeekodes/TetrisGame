import 'package:flutter/material.dart';
import 'package:tetris/provider/themes.dart';
import 'package:tetris/values/appColors.dart';


class MyDecorations {
  static BoxDecoration getCustomBoxDecoration(ThemeColor currentThemeColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color:
      currentThemeColor == ThemeColor.Blue
          ?
      AppColors.color66.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Yellow
          ?
      AppColors.yellow.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Green
          ?
      AppColors.color4E.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Purple
          ?
      AppColors.colorA3.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Orange
          ?
      AppColors.orange.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Grey
          ?
      AppColors.color28.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Red
          ?
      AppColors.color1C.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Pink
          ?
      AppColors.colorBF.withOpacity(0.6)
          :
      currentThemeColor == ThemeColor.Silver
          ?
      AppColors.color99.withOpacity(0.6)
          :
      AppColors.colorE8.withOpacity(0.5),
    );
  }

  static BoxDecoration getCustomBoxWithOutOpacity(ThemeColor currentThemeColor) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      color:
      currentThemeColor == ThemeColor.Blue
          ?
      AppColors.color3C
          :
      currentThemeColor == ThemeColor.Yellow
          ?
      AppColors.yellow
          :
      currentThemeColor == ThemeColor.Green
          ?
      AppColors.color4E
          :
      currentThemeColor == ThemeColor.Purple
          ?
      AppColors.color7A
          :
      currentThemeColor == ThemeColor.Orange
          ?
      AppColors.orangeColor
          :
      currentThemeColor == ThemeColor.Grey
          ?
      AppColors.color20
          :
      currentThemeColor == ThemeColor.Red
          ?
      AppColors.color16
          :
      currentThemeColor == ThemeColor.Pink
          ?
      AppColors.color83
          :
      currentThemeColor == ThemeColor.Silver
          ?
      AppColors.color5C
          :
      AppColors.colorEB,
    );
  }

  static DecorationImage decorationImage(ThemeColor currentThemeColor,ImageProvider<Object> image){
    return DecorationImage(
      fit: BoxFit.fill,
      colorFilter:
      currentThemeColor == ThemeColor.Blue
          ?
      ColorFilter.mode(Colors.transparent, BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Yellow
          ?
      ColorFilter.mode(AppColors.yellow.withOpacity(0.45), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Green
          ?
      ColorFilter.mode(AppColors.color4E.withOpacity(0.60), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Purple
          ?
      ColorFilter.mode(AppColors.colorA3.withOpacity(0.60), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Orange
          ?
      ColorFilter.mode(AppColors.orange.withOpacity(0.50), BlendMode.srcOver)
        :
      currentThemeColor == ThemeColor.Grey
          ?
      ColorFilter.mode(AppColors.color28.withOpacity(0.6), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Red
          ?

      ColorFilter.mode(AppColors.color1C.withOpacity(0.5), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Pink
          ?
      ColorFilter.mode(AppColors.colorBF.withOpacity(0.60), BlendMode.srcOver)
          :
      currentThemeColor == ThemeColor.Silver
          ?
      ColorFilter.mode(AppColors.color99.withOpacity(0.60), BlendMode.srcOver)
          :
      ColorFilter.mode(Colors.transparent, BlendMode.srcOver),
      image: image
    );
  }


  static Color getColorHere(ThemeColor currentThemeColor){
    return  currentThemeColor == ThemeColor.Blue
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Yellow
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Green
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Purple
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Orange
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Grey
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Red
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Pink
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Silver
        ?
    AppColors.textColor39
        :
    AppColors.textColor39;

  }


  static Color textColorHere(ThemeColor currentThemeColor){
    return  currentThemeColor == ThemeColor.Blue
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Yellow
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Green
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Purple
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Orange
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Grey
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Red
        ?
    AppColors.textColor39
        :
    currentThemeColor == ThemeColor.Pink
        ?
    AppColors.white
        :
    currentThemeColor == ThemeColor.Silver
        ?
    AppColors.white
        :
    AppColors.colorE8;

  }

  static AssetImage bgImage(ThemeColor currentThemeColor){
    return AssetImage(
        currentThemeColor == ThemeColor.Blue
            ?
        'assets/images/blue_theme.png'
            :
        currentThemeColor == ThemeColor.Yellow
            ?
        'assets/images/light.png'
            :
        currentThemeColor == ThemeColor.Green
            ?
        'assets/images/green_theme.png'
            :
        currentThemeColor == ThemeColor.Purple
            ?
        'assets/images/purple_theme.png'
            :
        currentThemeColor == ThemeColor.Orange
            ?
        'assets/images/orange_theme.png'
            :
        currentThemeColor == ThemeColor.Grey
            ?
        'assets/images/grey_theme.png'
            :
        currentThemeColor == ThemeColor.Red
            ?
        'assets/images/red_theme.png'
            :
        currentThemeColor == ThemeColor.Pink
            ?
        'assets/images/pink_theme.png'
            :
        currentThemeColor == ThemeColor.Silver
            ?
        'assets/images/silver_theme.png'
            :
        'assets/images/bg_main.png'
    );

  }


}
