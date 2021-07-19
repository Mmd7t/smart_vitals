import 'package:flutter/material.dart';

import '../themes.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    Key key,
    this.text,
    this.font,
  }) : super(key: key);

  final String text;
  final TextStyle font;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0, 1],
              colors: [AppColors.clightGreen, AppColors.cDarkblue])
          .createShader(bounds),
      child: Text(
        text,
        style: font.copyWith(color: AppColors.cWhite),
      ),
    );
  }
}
