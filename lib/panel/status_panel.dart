import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/gamer/block.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/generated/l10n.dart';
import 'package:tetris/material/briks.dart';
import 'package:tetris/values/appColors.dart';
import 'package:tetris/values/components.dart';
import 'package:tetris/values/font_utils.dart';

class StatusPanel extends StatelessWidget {
  final bool isDisplay;

  const StatusPanel({
    Key? key,
    required this.isDisplay,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Container(
      color: AppColors.colorF9,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

              Text(S.of(context).points,
          style: FontTextStyleUtilities.textStyle12.copyWith(
            fontFamily: 'Montserrat-Bold',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
            color: AppColors.color3C,
          )
        ),

          Text(
              GameState.of(context).points.toString().padLeft(6, '0'),
              style: FontTextStyleUtilities.textStyle15.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                color: AppColors.color3C,
              )),
        /*  Number(number: GameState.of(context).points),*/
          SizedBox(height: 8),
          Text(S.of(context).cleans,
              style: FontTextStyleUtilities.textStyle12.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
                color: AppColors.color3C,
              )
          ),
          SizedBox(height: 2),
          Text(
              GameState.of(context).cleared.toString().padLeft(6, '0'),
              style: FontTextStyleUtilities.textStyle15.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                color: AppColors.color3C,
              )),

          SizedBox(height: 8),
          Text(S.of(context).level,
              style: FontTextStyleUtilities.textStyle13.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
                color: AppColors.color3C,
              )
          ),
          SizedBox(height: 4),
          Text(
              GameState.of(context).level.toString().padLeft(6, '0'),
              style: FontTextStyleUtilities.textStyle15.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                color: AppColors.color3C,
              )),
          SizedBox(height: 10),
          Text(S.of(context).next,
              style: FontTextStyleUtilities.textStyle13.copyWith(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
                color: AppColors.color3C,
              )),
          SizedBox(height: 4),
          _NextBlock(),
          Spacer(),
          _GameStatus(isDisplay: isDisplay),
        ],
      ),
    );
  }
}

class _NextBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<int>> data = [List.filled(4, 0), List.filled(4, 0)];
    final next = BLOCK_SHAPES[GameState.of(context).next.type]!;
    for (int i = 0; i < next.length; i++) {
      for (int j = 0; j < next[i].length; j++) {
        data[i][j] = next[i][j];
      }
    }
    return Column(
      children: data.map((list) {
        return Row(
          children: list.map((b) {
            return b == 1 ?  Brik.normal() :  Brik.empty();
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _GameStatus extends StatefulWidget {
  final bool isDisplay;

  const _GameStatus({
    Key? key,
    required this.isDisplay,
  }) : super(key: key);
  @override
  _GameStatusState createState() {
    return new _GameStatusState();
  }
}

class _GameStatusState extends State<_GameStatus> {
  Timer? _timer;

  bool _colonEnable = true;

  int _minute = 0;

  int _hour = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _colonEnable = !_colonEnable;
        _minute = now.minute;
        _hour = now.hour;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var width =  MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[

        Image.asset('assets/images/soundmute.png',
          width: width*.05,
          color: /*GameState.of(context).muted */ Utils.isSoundOn ? AppColors.color3C: AppColors.colorE0,
        ),


        // IconSound(enable: GameState.of(context).muted),
        SizedBox(width: width*.005),
        Icon(
          Icons.pause,
          size: width*.05,
          color: GameState.of(context).states == GameStates.paused ? AppColors.color3C: AppColors.colorE0,
        ),

        Expanded(child: SizedBox()),
        Text(
            _hour.toString().padLeft(2, '0'),
            style: FontTextStyleUtilities.textStyle16.copyWith(
              fontFamily: 'Montserrat-Bold',
              fontSize: widget.isDisplay?12:13,
              fontWeight: FontWeight.w700,
              color: AppColors.color3C,
            )),
        // Number(number: _hour, length: 2, padWithZero: true),
        // IconColon(enable: _colonEnable),

        Text(':',
            style: FontTextStyleUtilities.textStyle16.copyWith(
              fontFamily: 'Montserrat-Bold',
              fontWeight: FontWeight.w700,
              fontSize: widget.isDisplay?12:13,
              color: _colonEnable ? Colors.black : Colors.grey,
            )
        ),

        Text(
            _minute.toString().padLeft(2, '0'),
            style: FontTextStyleUtilities.textStyle16.copyWith(
              fontFamily: 'Montserrat-Bold',
              fontSize: widget.isDisplay?12:13,
              fontWeight: FontWeight.w700,
              color: AppColors.color3C,
            )),
        // Number(number: _minute, length: 2, padWithZero: true),
      ],
    );
  }
}
