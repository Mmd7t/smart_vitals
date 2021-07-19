import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes.dart';
import 'Gradient_text.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    this.text,
    this.arrowcolor,
    this.gradienttext = true,
    this.withicon = true,
    this.icon,
  }) : super(key: key);

  final String text;
  final Color arrowcolor;
  final bool gradienttext;
  final bool withicon;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 32),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
              semanticsLabel: 'Arrow',
              color: arrowcolor,
            ),
          ),
        ),
        SizedBox(width: 8),
        gradienttext
            ? GradientText(text: text, font: AppFonts.profile)
            : Text(
                text,
                style: AppFonts.buttonText.copyWith(
                  color: AppColors.cdarkwhite,
                ),
              ),
        SizedBox(width: 8),
        Container(
          width: 24,
          height: 24,
          child: withicon ? SvgPicture.asset('assets/images/$icon.svg') : null,
        )
      ],
    );
  }
}
