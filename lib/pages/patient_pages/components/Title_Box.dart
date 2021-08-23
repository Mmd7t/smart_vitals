import 'package:flutter/material.dart';

import '../../../themes.dart';

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.065,
      child: Center(
        child: Text(
          'What vitals do you want to measure ?',
          style: AppFonts.captiontext2.copyWith(
            fontSize:size.aspectRatio*35,
            color: AppColors.cblack,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.cWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(82.0),
        ),
        border:
            Border.all(color: AppColors.cblack.withOpacity(0.2), width: 1.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.cblack[500],
            offset: Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
