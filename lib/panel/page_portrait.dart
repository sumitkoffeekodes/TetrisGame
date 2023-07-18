import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/main.dart';
import 'package:tetris/panel/controller.dart';
import 'package:tetris/panel/screen.dart';
import 'package:tetris/provider/darktheme.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/responsive_value.dart';

part 'page_land.dart';

class PagePortrait extends StatefulWidget {
  @override
  State<PagePortrait> createState() => _PagePortraitState();
}

class _PagePortraitState extends State<PagePortrait> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.72;

    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: size.height,
            width: size.width,
            decoration:   BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/bg_main.png'),
                )
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
                        "assets/images/logo_terties.png",
                      color: themeChange.darkTheme ? AppColors.color31: AppColors.white,
                    ),
                    decoration: BoxDecoration(
                        color: themeChange.darkTheme ? AppColors.colorEB: AppColors.color3C,

                    ),
                  ),
                  SizedBox(height: size.height*0.006),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: getWidth(15),right: getWidth(15),top: getHeight(8),bottom: getHeight(5)),
                          width: size.width,
                          child: Image.asset("assets/images/frame.png",
                            fit: BoxFit.fill,
                            color: themeChange.darkTheme ? AppColors.color31: AppColors.white,
                          ),
                          decoration:   BoxDecoration(
                            color: themeChange.darkTheme ? AppColors.colorEB: AppColors.color3C,
                          )),
                      Positioned(
                        top: size.height*0.055,
                        child: _ScreenDecoration(child: Screen(width: screenW)),
                      )
                    ],
                  ),
                  SizedBox(height: size.height*0.008),
                  GameController(),
                ],
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
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}
