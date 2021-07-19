import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes.dart';
import 'Gradient_text.dart';
import 'Gray_line.dart';

class AnmitedWidget extends StatelessWidget {
  const AnmitedWidget({
    Key key,
    @required this.size,
    this.figure,
    this.advice,
    this.condition,
    this.figureH,
    this.figureW,
  }) : super(key: key);

  final Size size;
  final String figure;
  final String advice;
  final String condition;
  final double figureH;
  final double figureW;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(microseconds: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          GradientText(
            text: 'Click the circle to measure again',
            font: AppFonts.profile,
          ),
          SizedBox(
            height: 24,
          ),
          GrayLine(size: size),
          SizedBox(
            height: 4,
          ),
          Text('How you stack up!',
              style: AppFonts.captiontext.copyWith(
                color: Colors.black,
              )),
          SizedBox(
            height: 8,
          ),
          Container(
            height: figureH,
            width: figureW,
            child: SvgPicture.asset(
              'assets/images/$figure.svg',
            ),
          ),
          Text(
            condition,
            style: AppFonts.captiontext.copyWith(color: AppColors.cblack),
          ),
          SizedBox(
            height: 8,
          ),
          GrayLine(size: size),
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
