import 'package:flutter/material.dart';
import '../themes.dart';

class GradientBoarder extends StatelessWidget {
  const GradientBoarder({
    Key key,
    @required this.size,
    this.widget,
    this.width,
    this.rad,
    this.height,
    this.offesetX = 0,
    this.offesetY = 0,
    this.blur = 0,
    this.color = Colors.white,
  }) : super(key: key);

  final Size size;
  final Widget widget;
  final double rad;
  final double width;
  final double height;
  final double offesetX;
  final double offesetY;
  final double blur;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.cDarkblue, AppColors.clightGreen],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.cblack[500],
              offset: Offset(offesetX, offesetY),
              blurRadius: blur,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(rad - 2)),
        ),
        child: widget,
      ),
    );
  }
}
