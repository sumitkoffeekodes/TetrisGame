import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/material/briks.dart';
import 'package:tetris/material/material.dart';
import 'package:tetris/values/appColors.dart';
import 'package:vector_math/vector_math_64.dart' as v;

import 'player_panel.dart';
import 'status_panel.dart';

// const Color SCREEN_BACKGROUND = Color(0xff9ead86);
// const Color SCREEN_BACKGROUND = Color(0xffE0E0E0);

/// screen H : W;
class Screen extends StatelessWidget {
  ///the with of screen
  final double width;
  final bool isDisplay;

  const Screen({
    Key? key,
    required this.width,
    required this.isDisplay,
  }) : super(key: key);

  // Screen.fromHeight(double height) : this(width: ((height - 6) / 2 + 6) / 0.6);
  Screen.fromHeight(double height)
      : this(
    width: ((height - 6) / 2 + 6) / 0.6,
    isDisplay: false, // Set a default value for isDisplay if needed
  );

  @override
  Widget build(BuildContext context) {
    //play panel need 60%
    final playerPanelWidth = isDisplay? width * 0.70:width * 0.80;
    return Shake(
      shake: GameState.of(context).states == GameStates.drop,
      child: SizedBox(
        height: (playerPanelWidth - 6) * 2 + 6,
        child: Container(
          color: AppColors.colorF9,
          // color: SCREEN_BACKGROUND,
          child: GameMaterial(
            child: BrikSize(
              size: getBrikSizeForScreenWidth(playerPanelWidth),
              child: Row(
                children: <Widget>[
                  PlayerPanel(width: playerPanelWidth),
                  Expanded(child: StatusPanel(isDisplay: isDisplay)),

                  /* isDisplay
                      ?
                  Expanded(child: StatusPanel(isDisplay: isDisplay)):
                  SizedBox(
                      width: width - playerPanelWidth,
                      child: StatusPanel(isDisplay: isDisplay))*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Shake extends StatefulWidget {
  final Widget child;

  ///true to shake screen vertically
  final bool shake;

  const Shake({
    Key? key,
    required this.child,
    required this.shake,
  }) : super(key: key);

  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150))
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  void didUpdateWidget(Shake oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  v.Vector3 _getTranslation() {
    double progress = _controller.value;
    double offset = sin(progress * pi) * 1.5;
    return v.Vector3(0, offset, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translation(_getTranslation()),
      child: widget.child,
    );
  }
}
