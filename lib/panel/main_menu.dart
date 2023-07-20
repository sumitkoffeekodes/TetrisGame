
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/gamer/keyboard.dart';
import 'package:tetris/main.dart';
import 'package:tetris/material/audios.dart';
import 'package:tetris/panel/setting_page.dart';
import 'package:tetris/provider/themes.dart';
import 'package:tetris/values/components.dart';
import 'package:tetris/values/font_utils.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentThemeColor = themeProvider.themeColor;


    return Scaffold(
        // backgroundColor: themeChange.darkTheme ? AppColors.white : AppColors.black,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: MyDecorations.decorationImage(
                    currentThemeColor,
                    AssetImage(
                    currentThemeColor == ThemeColor.Blue
                        ?
                    'assets/images/background_image.png'
                        :
                    'assets/images/bg_default.png'

                    ),
                ),
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height/4.5),
                  Center(
                    child: Image.asset(
                      'assets/images/terties_logo.png',
                      width: width - 150,
                      color:  MyDecorations.getColorHere(currentThemeColor),
                    ),
                  ),
                  SizedBox(height: height/5),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context)=>
                                      Sound(child: Game(child: KeyboardController(child: HomePage())))
                                  )
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1,
                                        color: MyDecorations.getColorHere(currentThemeColor),
                                  )
                                  ),
                                  child: Container(
                                    height: height*.06,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                     color: MyDecorations.getColorHere(currentThemeColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'PLAY',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                          style: FontTextStyleUtilities.textStyle16.copyWith(
                                              fontWeight: FontWeight.w900,
                                            color:  MyDecorations.textColorHere(currentThemeColor),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: height*.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SettingPage()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1,
                                        color: MyDecorations.getColorHere(currentThemeColor),
                                      )
                                  ),
                                  child: Container(
                                    height: height*.06,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: MyDecorations.getColorHere(currentThemeColor),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SETTING',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: FontTextStyleUtilities.textStyle16.copyWith(
                                        fontWeight: FontWeight.w900,
                                          color:  MyDecorations.textColorHere(currentThemeColor),
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: height*.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        width: 1,
                                      color: MyDecorations.getColorHere(currentThemeColor),

                                    )
                                ),
                                child: Container(
                                  height: height*.06,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: MyDecorations.getColorHere(currentThemeColor),

                                  ),
                                  child: Center(
                                    child: Text(
                                      'EXIT',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                        style: FontTextStyleUtilities.textStyle16.copyWith(
                                            fontWeight: FontWeight.w900,
                                          color:  MyDecorations.textColorHere(currentThemeColor),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        )
    );
  }
}
