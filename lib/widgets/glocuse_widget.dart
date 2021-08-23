import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../themes.dart';
import 'Gradient_text.dart';
import 'Gray_line.dart';

class Glocuse extends StatelessWidget {

  Glocuse({
    Key key,
    @required this.size,
    this.figure,
    this.advice,
    this.condition,
    this.figureH,
    this.figureW,
  }) : super(key: key);

  final size;
  final figure;
  final advice;
  final condition;
  final figureH;
  final figureW;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(microseconds: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8,
          ),
          GradientText(
            text: 'Click the circle to measure again',
            font: AppFonts.profile,
          ),
          SizedBox(
            height: 5,
          ),
          GrayLine(size: size),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Our advice to you',
            style: AppFonts.captiontext.copyWith(
              color: Colors.black,
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Center(
              child: Text(
                advice,
                style: AppFonts.captiontext.copyWith(color: AppColors.cblack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}