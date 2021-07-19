import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gradient_text.dart';

import '../../../themes.dart';
import 'Gradient_dividing_line.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.size,
    this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: AppColors.cLightGrey,
          height: size.height * 0.3,
          width: size.width,
        ),
        Container(
          child: Positioned(
            top: size.height * 0.14,
            child: GradientText(text: text, font: AppFonts.heading1),
          ),
        ),
        Positioned(
          top: size.height * 0.295,
          child: GradientDividingLine(size: size),
        ),
      ],
    );
  }
}
