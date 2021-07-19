import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes.dart';

class BoxButton extends StatelessWidget {
  const BoxButton({
    Key key,
    @required this.size,
    this.height,
    this.width,
    this.buttom,
  }) : super(key: key);

  final Size size;
  final List buttom;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.cdarkwhite,
      splashColor: AppColors.cdarkwhite,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => buttom[2]));
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/${buttom[1]}.svg',
              width: 45,
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(
                buttom[0],
                textAlign: TextAlign.center,
                style: AppFonts.boxText.copyWith(color: AppColors.cblack),
              ),
            )
          ],
        ),
      ),
    );
  }
}
