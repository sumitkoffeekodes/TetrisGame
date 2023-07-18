import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/generated/l10n.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/font_utils.dart';
import 'package:tetris/values/responsive_value.dart';

class GameController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: width*0.035,right: width*0.035,top: height*0.01,bottom: height*0.01),
          margin: EdgeInsets.only(left: width*0.035,right: width*0.035),
          child: SystemButtonGroup(),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.color3C
          ),
        ),
        SizedBox(height: height*0.008),
        Container(
          padding: EdgeInsets.only(left: width*0.1,right: width*0.12,top: height*0.009,bottom: height*0.009),
          margin: EdgeInsets.only(left: width*0.035,right: width*0.035),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Game.of(context).drop();
                },
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        width: getWidth(80),
                        height: getHeight(80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.4), // Inner shadow color
                              blurRadius: 5.0,
                              offset: Offset(-3, -3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFCCB06),
                              Color(0xFFEF420C),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                          ),
                        )),
                    Positioned(
                      top: 15,
                      bottom: 15,
                      left: 15,
                      right: 15,
                      child: Container(
                          child: Image.asset("assets/images/drop.png"),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.1), // Inner shadow color
                                blurRadius: 2.0,
                                offset: Offset(2, 5),
                              ),
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.1,
                              color: AppColors.white.withOpacity(0.1),
                              style: BorderStyle.solid,
                            ),

                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFE9BA).withOpacity(0.1),
                                  Color(0xFFFFE9BA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.2,0.9]
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: math.pi / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: _DIRECTION_SPACE),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.5,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: (){
                                  Game.of(context).rotate();
                                },
                                child: Container(
                                  width: getWidth(27),
                                  height: getHeight(27),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.white.withOpacity(0.3),
                                        blurRadius: 3.0,
                                        offset: Offset(-3, 1),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFCCB06),
                                        Color(0xFFEF420C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 9,
                                bottom: 9,
                                left: 9,
                                right: 9,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child:  InkWell(
                                    onTap: (){
                                      Game.of(context).rotate();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Transform.rotate(
                                            angle: -math.pi / 4,
                                            child: Image.asset("assets/images/pattern_vector.png")),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.white.withOpacity(0.1), // Inner shadow color
                                              blurRadius: 2.0,
                                              offset: Offset(2, 5),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                            width: 0.1,
                                            color: AppColors.white.withOpacity(0.1),
                                            style: BorderStyle.solid,
                                          ),

                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFE9BA).withOpacity(0.1),
                                                Color(0xFFFFE9BA),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [0.2,0.9]
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                        SizedBox(width: _DIRECTION_SPACE),
                        Transform.scale(
                          scale: 1.5,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: (){
                                  Game.of(context).right();
                                },
                                child: Container(
                                  width: getWidth(27),
                                  height: getHeight(27),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.white.withOpacity(0.3),
                                        blurRadius: 3.0,
                                        offset: Offset(-3, 1),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFCCB06),
                                        Color(0xFFEF420C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 9,
                                bottom: 9,
                                left: 9,
                                right: 9,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child:  InkWell(
                                    onTap: (){
                                      Game.of(context).right();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(3.5),
                                        child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationZ(
                                              -math.pi / 4,
                                            ),
                                            child: Image.asset("assets/images/right_vector.png")),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.white.withOpacity(0.1), // Inner shadow color
                                              blurRadius: 2.0,
                                              offset: Offset(2, 5),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                            width: 0.1,
                                            color: AppColors.white.withOpacity(0.1),
                                            style: BorderStyle.solid,
                                          ),

                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFE9BA),
                                                Color(0xFFFFE9BA).withOpacity(0.1),
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomCenter,
                                              stops: [0.2,0.9]
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),

                      ],
                    ),
                    SizedBox(height: _DIRECTION_SPACE),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.5,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: (){
                                  Game.of(context).left();
                                },
                                child: Container(
                                  width: getWidth(27),
                                  height: getHeight(27),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.white.withOpacity(0.3),
                                        blurRadius: 3.0,
                                        offset: Offset(-3, 1),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFCCB06),
                                        Color(0xFFEF420C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 9,
                                bottom: 9,
                                left: 9,
                                right: 9,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: InkWell(
                                    onTap: (){
                                      Game.of(context).left();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(3.5),
                                        child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationZ(
                                              -math.pi / 4,
                                            ),
                                            child: Image.asset("assets/images/left_vector.png",width: 50,)),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.white.withOpacity(0.1), // Inner shadow color
                                              blurRadius: 2.0,
                                              offset: Offset(2, 5),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                            width: 0.1,
                                            color: AppColors.white.withOpacity(0.1),
                                            style: BorderStyle.solid,
                                          ),

                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFE9BA).withOpacity(0.1),
                                                Color(0xFFFFE9BA),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              stops: [0.2,0.9]
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),

                        SizedBox(width: _DIRECTION_SPACE),

                        Transform.scale(
                          scale: 1.5,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                onTap: (){
                                  Game.of(context).down();
                                },
                                child: Container(
                                  width: getWidth(27),
                                  height: getHeight(27),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.white.withOpacity(0.3),
                                        blurRadius: 3.0,
                                        offset: Offset(-3, 1),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFCCB06),
                                        Color(0xFFEF420C),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 9,
                                bottom: 9,
                                left: 9,
                                right: 9,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child:  InkWell(
                                    onTap: (){
                                      Game.of(context).down();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(3.5),
                                        child:
                                        Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationZ(
                                              -math.pi / 4,
                                            ),
                                            child: Image.asset("assets/images/down_vector.png")),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.white.withOpacity(0.1), // Inner shadow color
                                              blurRadius: 2.0,
                                              offset: Offset(2, 5),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                            width: 0.1,
                                            color: AppColors.white.withOpacity(0.1),
                                            style: BorderStyle.solid,
                                          ),

                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFE9BA).withOpacity(0.1),
                                                Color(0xFFFFE9BA),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              stops: [0.2,0.9]
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),

                        /*_Button(
                    size: _DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).down();
                    },
                  ),*/
                      ],
                    ),
                    SizedBox(height: _DIRECTION_SPACE),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.color3C
          ),
        ),

      ],
    );
  }
}

const Size _DIRECTION_BUTTON_SIZE = const Size(48, 48);

const Size _SYSTEM_BUTTON_SIZE = const Size(28, 28);

const double _DIRECTION_SPACE = 24;

const double _iconSize = 16;

class DirectionController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[

      ],
    );
  }
}

class SystemButtonGroup extends StatelessWidget {
  static const _systemButtonColor = const Color(0xFF2dc421);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _Description(
          text: S.of(context).reset,
          child: InkWell(
            onTap: (){
              Game.of(context).reset();
            },
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
               /* BoxShadow(
                color: AppColors.color3C, // Outer shadow color
                blurRadius: 4.0,
                offset: Offset(2, 2),
                ),*/
                BoxShadow(
                color: AppColors.white.withOpacity(0.4), // Inner shadow color
                blurRadius: 5.0,
                offset: Offset(-2, -2),
                ),
                ],
                gradient: LinearGradient(
                colors: [
                  Color(0xFFEF420C),
                  Color(0xFFFCCB06),
                ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                )),
                Positioned(
                 top: 5,
                 bottom: 5,
                 left: 5,
                 right: 5,
                 child: Container(
                   padding: EdgeInsets.all(5),
                   child: Image.asset("assets/images/reset.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.1,
                          color: AppColors.white,
                          style: BorderStyle.solid,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEF420C),
                            Color(0xFFFFE9BA),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0,1.0]
                        ),
                      )),
               ),
              ],
            ),
          ),
         /* child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              enableLongPress: false,
              color: Colors.red,
              onTap: () {
                Game.of(context).reset();
              }),*/
        ),
        _Description(
          text: S.of(context).pause_resume,
          child:
          InkWell(
              onTap: (){
                Game.of(context).pauseOrResume();
              },
              child: InkWell(
                onTap: (){
                  Game.of(context).pauseOrResume();
                },
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.4), // Inner shadow color
                              blurRadius: 5.0,
                              offset: Offset(-2, -2),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFEF420C),
                              Color(0xFFFCCB06),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )),
                    Positioned(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5,
                      child: Container(
                          padding: EdgeInsets.all(7),
                          child: Image.asset("assets/images/pause.png"),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.1,
                              color: AppColors.white,
                              style: BorderStyle.solid,
                            ),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFFEF420C),
                                  Color(0xFFFFE9BA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0,1.0]
                            ),
                          )),
                    ),
                  ],
                ),
              ),
          ),
          /*child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              color: _systemButtonColor,
              enableLongPress: false,
              onTap: () {
                Game.of(context).pauseOrResume();
              }),*/
        ),
        _Description(
          text: S.of(context).sounds,
          child:
          InkWell(
            onTap: (){
              Game.of(context).soundSwitch();
            },
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.white.withOpacity(0.4), // Inner shadow color
                          blurRadius: 5.0,
                          offset: Offset(-2, -2),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEF420C),
                          Color(0xFFFCCB06),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    )),
                Positioned(
                  top: 5,
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: Container(
                      padding: EdgeInsets.all(7),
                      child: Image.asset("assets/images/sound.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.1,
                          color: AppColors.white,
                          style: BorderStyle.solid,
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFEF420C),
                              Color(0xFFFFE9BA),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0,1.0]
                        ),
                      )),
                ),
              ],
            ),
          ),
         /* child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              color: _systemButtonColor,
              enableLongPress: false,
              onTap: () {
                Game.of(context).soundSwitch();
              }),*/
        ),

      ],
    );
  }
}

class DropButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Description(
      text: 'drop',
      child: _Button(
          enableLongPress: false,
          size: Size(90, 90),
          onTap: () {
            Game.of(context).drop();
          }
          ),
    );
  }
}


class _Button extends StatefulWidget {
  final Size size;
  final Widget? icon;

  final VoidCallback onTap;

  ///the color of button
  final Color color;

  final bool enableLongPress;

  const _Button({
    Key? key,
    required this.size,
    required this.onTap,
    this.icon,
    this.color = Colors.blue,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonState createState() {
    return new _ButtonState();
  }
}

///show a hint text for child widget
class _Description extends StatelessWidget {
  final String text;

  final Widget child;

  final AxisDirection direction;

  const _Description({
    Key? key,
    required this.text,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (direction) {
      case AxisDirection.right:
        widget = Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child, SizedBox(width: 8), Text(text)]);
        break;
      case AxisDirection.left:
        widget = Row(
          children: <Widget>[Text(text), SizedBox(width: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.up:
        widget = Column(
          children: <Widget>[Text(text), SizedBox(height: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.down:
        widget = Column(
          children: <Widget>[child, SizedBox(height: 7), Text(text)],
          mainAxisSize: MainAxisSize.min,
        );
        break;
    }
    return DefaultTextStyle(
      child: widget,
      style: FontTextStyleUtilities.textStyle12.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat-Bold',
        color: AppColors.white
      )
    );
  }
}

class _ButtonState extends State<_Button> {
  Timer? _timer;

  bool _tapEnded = false;

  late Color _color;

  @override
  void didUpdateWidget(_Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
