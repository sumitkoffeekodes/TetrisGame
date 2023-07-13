
import 'package:flutter/material.dart';
import 'package:tetris/Utils/utils.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/responsive_value.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(80)),
                  Center(
                    child: Image.asset(
                      'assets/images/terties_logo.png',
                      width: width - 160,
                    ),
                  ),
                  SizedBox(height: getHeight(60)),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: getWidth(50)),
                        height: getHeight(500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.color66.withOpacity(0.7)
                        ),
                      ),
                      Positioned(
                        top: height*-.03,
                        left: width/3.5,
                        right: width/3.5,
                        child: Row(
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
                                    height: getHeight(45),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color:  AppColors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SETTING',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: FontStyleUtils.style(18).copyWith(
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
