import 'package:flutter/material.dart';

import '../themes.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    Key key,
    @required this.size,
    this.radius,
  }) : super(key: key);

  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cDarkblue, AppColors.clightGreen],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
        ),
      ),
    );
  }
}
