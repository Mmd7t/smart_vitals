import 'package:flutter/material.dart';

import '../themes.dart';

class GradientDividingLine extends StatelessWidget {
  const GradientDividingLine({
    Key key,
    @required this.width,
    this.height = 3,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.cDarkblue, AppColors.clightGreen]),
      ),
    );
  }
}
