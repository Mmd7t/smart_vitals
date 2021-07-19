import 'package:flutter/material.dart';

import '../../../themes.dart';

class GradientDividingLine extends StatelessWidget {
  const GradientDividingLine({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: size.width * 0.75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.cDarkblue, AppColors.clightGreen]),
      ),
    );
  }
}
