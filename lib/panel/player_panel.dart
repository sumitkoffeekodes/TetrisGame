import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/material/briks.dart';
import 'package:tetris/material/images.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/provider/themes.dart';

import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/font_utils.dart';

const _PLAYER_PANEL_PADDING = 6;

Size getBrikSizeForScreenWidth(double width) {
  return Size.square((width - _PLAYER_PANEL_PADDING) / GAME_PAD_MATRIX_W);
}

///the matrix of player content
class PlayerPanel extends StatelessWidget {
  //the size of player panel
  final Size size;

  PlayerPanel({
    Key? key,
    required double width,
  })  : assert(width != 0),
        size = Size(width, width * 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("size : $size");
    return SizedBox.fromSize(
      size: size,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Stack(
          children: <Widget>[
            _PlayerPad(),
            _GameUninitialized(),
          ],
        ),
      ),
    );
  }
}

class _PlayerPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: GameState.of(context).data.map((list) {
        return Row(
          children: list.map((b) {
            return b == 1
                ? const Brik.normal()
                : b == 2
                    ? const Brik.highlight()
                    : const Brik.empty();
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _GameUninitialized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentThemeColor = themeProvider.themeColor;
    if (GameState.of(context).states == GameStates.none) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconDragon(animate: true),
            SizedBox(height: 16),
            Text(
              "Tetris",
              style: FontTextStyleUtilities.textStyle16.copyWith(
                fontFamily: 'Montserrat-Bold',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
                color: currentThemeColor == ThemeColor.Blue ? AppColors.white: AppColors.color3C,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
