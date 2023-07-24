import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tetris/Utils/utils.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/main.dart';
import 'package:tetris/panel/controller.dart';
import 'package:tetris/panel/screen.dart';
import 'package:tetris/provider/themes.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/components.dart';
import 'package:tetris/values/responsive_value.dart';

part 'page_land.dart';

class PagePortrait extends StatefulWidget {
  @override
  State<PagePortrait> createState() => _PagePortraitState();
}

class _PagePortraitState extends State<PagePortrait> {

  bool isDisplay = false;

  getDisplay() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      isDisplay = sharedPreferences.getBool("isDisplay")!;
    });

  }

  bool isSoundOn = true;

  void _loadSoundState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSoundOn = prefs.getBool('isSoundOn') ?? true;
      FontStyleUtils.isSoundOn = isSoundOn;
    });

  }


  @override
  void initState() {
    super.initState();
    getDisplay();
    _loadSoundState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.75;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentThemeColor = themeProvider.themeColor;

    return WillPopScope(
      onWillPop: () async {
        if(Game.of(context).states==GameStates.running){
          Game.of(context).pauseOrResume();
          showDialog(context: context, builder: (BuildContext context2){

            return AlertDialog(
              insetPadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              content: StatefulBuilder(
                  builder:(BuildContext context3, setState){
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context3).size.height * 0.37,
                      ),
                      child: Container(
                        // height: MediaQuery.of(context).size.height /2.85,
                        width: MediaQuery.of(context3).size.width/1.2,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  'Exit?',
                                  textAlign: TextAlign.center,
                                  style: FontStyleUtils.style(16).copyWith(
                                      color: AppColors.black,
                                      fontFamily: 'Poppins-SemiBold'
                                  )),
                              SizedBox(height: getHeight(18)),
                              Center(
                                child: Image.asset(
                                  'assets/images/logout.png',
                                  fit: BoxFit.contain,
                                  height: getHeight(60),
                                ),
                              ),
                              SizedBox(height: getHeight(18)),
                              Text(
                                  'Are you sure you want to exit?',
                                  style: FontStyleUtils.style(14).copyWith(
                                    color: AppColors.black,
                                    fontFamily: 'Poppins-Regular',
                                  )),
                              SizedBox(height: getHeight(15)),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: getWidth(55),
                                  height: getHeight(3),
                                ),
                              ),
                              SizedBox(height: getHeight(30)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pop(context3);
                                        Navigator.pop(context3);
                                      },
                                      child: Container(
                                        height: getHeight(50),
                                        decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color:
                                          MyDecorations.normalContainerColor(currentThemeColor).withOpacity(0.3)
                                          // color: AppColors.colorEE,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Yes, Exit',
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.center,
                                            style: FontStyleUtils.style(16).copyWith(
                                                color:
                                                AppColors.textColor39,
                                                fontFamily: 'Poppins-SemiBold',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: getWidth(15)),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){

                                        Game.of(context).pauseOrResume();
                                        Navigator.pop(context3);
                                      },
                                      child: Container(
                                        height: getHeight(50),
                                        decoration:  BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: MyDecorations.normalContainerColor(currentThemeColor)
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Resume',
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.center,
                                            style: FontStyleUtils.style(16).copyWith(
                                                color:
                                                currentThemeColor == ThemeColor.Yellow
                                                    ?
                                                AppColors.textColor39
                                                    :
                                                AppColors.white,
                                                fontFamily: 'Poppins-SemiBold',
                                                fontWeight: FontWeight.w600),
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
                      ),
                    );
                  }
              ),
            );


          }
          );
        }else{
          Navigator.pop(context);
        }

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: MyDecorations.bgImage(currentThemeColor),fit: BoxFit.fill)
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: getHeight(25),bottom: getHeight(15),left: getWidth(20),right: getWidth(20)),
                      width: size.width,
                      child: Image.asset(
                          "assets/images/banner_logo.png",
                        color:
                        currentThemeColor == ThemeColor.White || currentThemeColor == ThemeColor.Yellow
                            ?
                        AppColors.color31: AppColors.white,
                      ),
                      decoration:  MyDecorations.getCustomBoxWithOutOpacity(currentThemeColor)

                    ),
                    SizedBox(height: size.height*0.006),
                    isDisplay?
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: getWidth(15),right: getWidth(15),top: getHeight(8),bottom: getHeight(5)),
                            width: size.width,
                            child: Image.asset("assets/images/frame.png",
                              fit: BoxFit.fill,
                              color:
                              currentThemeColor == ThemeColor.White || currentThemeColor == ThemeColor.Yellow
                                  ?
                              AppColors.color31
                                  :
                              AppColors.white,
                            ),
                            decoration:  MyDecorations.getCustomBoxWithOutOpacity(currentThemeColor)
                        ),
                        Positioned(
                          top: size.height*0.055,
                          child: _ScreenDecoration(child: Screen(width: screenW,isDisplay: isDisplay)),
                        )
                      ],
                    )
                        :
                        Container(
                          padding: EdgeInsets.all(14),
                          width: size.width,
                          height: size.height/2,
                            child:  _ScreenDecoration(child: Screen(width: screenW, isDisplay: isDisplay)
                        )),
                    SizedBox(height: size.height*0.008),
                    GameController(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          left: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          right: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: AppColors.colorF9,
          child: child,
        ),
      ),
    );
  }
}
