
import 'package:flutter/material.dart';
import 'package:tetris/Utils/utils.dart';
import 'package:tetris/panel/setting_page.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/responsive_value.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            decoration:  const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/background_image.png'),
                )
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
                    ),
                  ),
                  SizedBox(height: height/5),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(100)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                        color: AppColors.white
                                    )
                                ),
                                child: Container(
                                  height: height*.06,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color:  AppColors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'PLAY',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: FontStyleUtils.style(16).copyWith(
                                          color: AppColors.textColor39  ,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w900),
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
                                          color: AppColors.white
                                      )
                                  ),
                                  child: Container(
                                    height: height*.06,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color:  AppColors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SETTING',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: FontStyleUtils.style(16).copyWith(
                                            color: AppColors.textColor39  ,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w900),
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
                                        color: AppColors.white
                                    )
                                ),
                                child: Container(
                                  height: height*.06,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color:  AppColors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'EXIT',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: FontStyleUtils.style(16).copyWith(
                                          color: AppColors.textColor39  ,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w900),
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
