import 'package:flutter/material.dart';

import '../themes.dart';

class GrayLine extends StatelessWidget {
  const GrayLine(
      {Key key, @required this.size, this.height = 8, Null Function() onTap})
      : super(key: key);

  final Size size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: size.width,
      color: AppColors.cLightGrey,
    );
  }
}
