import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes.dart';

Widget inputfield(var size, String hint, String icon, bool addicone,
    {bool isPass = false}) {
  return TextFormField(
    style: AppFonts.appText.copyWith(color: AppColors.cblack),
    obscureText: isPass,
    cursorColor: AppColors.cblack,
    decoration: InputDecoration(
      contentPadding: addicone
          ? EdgeInsets.only(top: 10, bottom: 10)
          : EdgeInsets.only(top: 10, bottom: 10, left: 20),
      isDense: true,
      hintText: hint,
      hintStyle: AppFonts.appText.copyWith(
        color: AppColors.cblack,
      ),
      suffixIcon: isPass
          ? Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 0, right: 15, bottom: 15),
              child: Icon(
                Icons.lock,
                color: AppColors.cblack,
              ),
            )
          : null,
      prefixIcon: addicone
          ? Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 10, bottom: 10),
              child: SvgPicture.asset(
                'assets/images/$icon.svg',
                width: 24,
                height: 24,
              ),
            )
          : null,
      border: InputBorder.none,
    ),
  );
}
