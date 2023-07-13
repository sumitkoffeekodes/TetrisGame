
import 'package:flutter/material.dart';
import 'package:tetris/Utils/utils.dart';
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
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: getHeight(140)),
                Center(
                  child: Image.asset(
                    'assets/images/terties_logo.png',
                    width: width - 180,
                  ),
                ),
                SizedBox(height: getHeight(50)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: getHeight(55),
                        decoration:  BoxDecoration(
                          color:  AppColors.white,
                        ),
                        child: Center(
                          child: Text(
                            'SUBMIT',
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: FontStyleUtils.style(18).copyWith(
                                color: AppColors.black  ,
                                fontFamily: 'Poppins-SemiBold',fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}
