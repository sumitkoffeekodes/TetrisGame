
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/Utils/utils.dart';
import 'package:tetris/provider/themes.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/components.dart';
import 'package:tetris/values/responsive_value.dart';
import 'package:tetris/values/themecolors.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  bool isSound = false;
  bool isMusic = false;

  final List<ThemeColor> colorOptions = [
    ThemeColor.Blue,
    ThemeColor.Yellow,
    ThemeColor.Green,
    ThemeColor.Purple,
    ThemeColor.Orange,
    ThemeColor.Grey,
    ThemeColor.Red,
    ThemeColor.Pink,
    ThemeColor.Silver,
    ThemeColor.White,
  ];


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // final themeChange = Provider.of<DarkThemeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentThemeColor = themeProvider.themeColor;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            decoration:   BoxDecoration(
                image: MyDecorations.decorationImage(
                    currentThemeColor,
                    AssetImage(
                        currentThemeColor == ThemeColor.Blue
                            ?
                        'assets/images/background_image.png'
                            :
                        'assets/images/bg_default.png'
                    )),

            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(65)),
                  Center(
                    child: Image.asset(
                      'assets/images/main_logo.png',
                      width: width - 150,
                      color: MyDecorations.getColorHere(currentThemeColor)
                    ),
                  ),
                  SizedBox(height: getHeight(60)),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: getWidth(42)),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: getWidth(40),right: getWidth(25),top: getHeight(50),bottom: getHeight(25)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'SOUND',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: FontStyleUtils.style(18).copyWith(
                                            color: MyDecorations.getColorHere(currentThemeColor),
                                            fontFamily: 'Montserrat-Bold',fontWeight: FontWeight.w900),
                                      ),

                                      Switch(
                                        onChanged: (value){
                                          setState(() {
                                            isSound = value;
                                          });
                                        },
                                        value: isSound,
                                        activeColor: AppColors.colorD6,
                                        activeTrackColor: AppColors.color9D,
                                        inactiveThumbColor: AppColors.color9D,
                                        inactiveTrackColor: AppColors.colorD6,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'MUSIC',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: FontStyleUtils.style(18).copyWith(
                                            color: MyDecorations.getColorHere(currentThemeColor),
                                            fontFamily: 'Montserrat-Bold',fontWeight: FontWeight.w900),
                                      ),
                                      Switch(
                                        onChanged: (value){
                                          setState(() {
                                            isMusic = value;
                                          });
                                        },
                                        value: isMusic,
                                        activeColor: AppColors.white,
                                        activeTrackColor: AppColors.color3C,
                                        inactiveThumbColor: AppColors.color3C,
                                        inactiveTrackColor: AppColors.white,
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
                              // padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: getHeight(15)),

                                  Text(
                                'THEME COLOR',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: FontStyleUtils.style(18).copyWith(
                                    color: AppColors.textColor39,
                                    fontFamily: 'Montserrat-Bold',fontWeight: FontWeight.w900)),

                                  GridView.builder(
                                    padding: EdgeInsets.only(left: getWidth(30),right: getWidth(30),top: getHeight(20)),
                                    itemCount: colorOptions.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                    ),
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final colorOption = colorOptions[index];
                                      bool showIcon = colorOption == themeProvider.themeColor;


                                      return GestureDetector(
                                        onTap: () {
                                          themeProvider.themeColor = colorOption;

                                          setState(() {
                                            showIcon =!showIcon;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1.0,
                                                color: ColorThemes.getColorForTheme(colorOption),
                                              )
                                          ),
                                          child: Container(
                                            child: Center(
                                              child:
                                              showIcon
                                                  ?
                                              Image.asset('assets/images/ok_sign.png',width: getWidth(17))
                                                  :
                                              SizedBox(),
                                            ),
                                            decoration:  BoxDecoration(
                                              color: ColorThemes.getColorForTheme(colorOption),
                                            ),
                                          ),
                                        ),

                                      /*  child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.color66
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            child: Center(
                                              child:
                                              showIcon
                                                  ?
                                              Image.asset('assets/images/ok_sign.png',width: getWidth(17))
                                                  :
                                              SizedBox(),
                                            ),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.color66,
                                            ),
                                          ),
                                        ),*/
                                        /*child: Container(
                                          width: 10,
                                          height: 10,
                                          color: ColorThemes.getColorForTheme(colorOption),
                                          child:
                                          showIcon
                                              ? Icon(Icons.check, color: Colors.white, size: 20)
                                              : SizedBox(),
                                        ),*/
                                      );
                                    },
                                  ),
                                  SizedBox(height: getHeight(15)),

                                /*  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              themeChange.darkTheme =! themeChange.darkTheme;
                                            });
                                            },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: AppColors.color66
                                                )
                                            ),
                                            child: Container(
                                              height: getHeight(40),
                                              width: getWidth(45),
                                              child: Center(
                                                child: Image.asset('assets/images/ok_sign.png',width: getWidth(17)),
                                              ),
                                              decoration:  BoxDecoration(
                                                color:  AppColors.color66,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.yellow
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.yellow,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.color4E
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.color4E,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: getHeight(15)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.colorA3
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.colorA3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.orange
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.color28
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.color28,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: getHeight(15)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.color1C
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.color1C,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.colorBF
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.colorBF,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: getWidth(12)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.color99
                                              )
                                          ),
                                          child: Container(
                                            height: getHeight(40),
                                            width: getWidth(45),
                                            decoration:  BoxDecoration(
                                              color:  AppColors.color99,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: getHeight(25)),*/


                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white,
                              ),
                            ),


                            SizedBox(height: getHeight(30)),
                          ],
                        ),
                        decoration: MyDecorations.getCustomBoxDecoration(currentThemeColor),
                      ),
                      Positioned(
                        top: height*-.03,
                        left: width/4.0,
                        right: width/4.0,
                        child: Row(
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
                                  height: getHeight(45),
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color:
                                    MyDecorations.getColorHere(currentThemeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'SETTING',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: FontStyleUtils.style(18).copyWith(
                                          color:  MyDecorations.textColorHere(currentThemeColor),
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
