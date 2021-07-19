import 'package:flutter/material.dart';

import '../../../themes.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.size,
    this.text,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.cDarkblue,
              AppColors.clightGreen,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: AppColors.cblack[500],
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppFonts.buttonText.copyWith(
              color: AppColors.cdarkwhite,
            ),
          ),
        ),
      ),
    );
  }
}
