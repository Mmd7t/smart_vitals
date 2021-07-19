import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';

import '../../../themes.dart';

class ProfileCirculeInfo extends StatelessWidget {
  const ProfileCirculeInfo({
    Key key,
    @required this.size,
    @required this.info,
    @required this.update,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final List info;
  final bool update;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          update
              ? GradientBoarder(
                  size: size,
                  color: AppColors.cLightGrey,
                  rad: 50,
                  width: 50,
                  height: 50,
                  widget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/images/${info[0]}.svg',
                      height: 24,
                      width: 24,
                    ),
                  ))
              : Container(
                  height: 50,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/images/${info[0]}.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cLightGrey,
                    shape: BoxShape.circle,
                  ),
                ),
          SizedBox(
            height: 4,
          ),
          Text(
            info[1],
            style: AppFonts.profileinfo.copyWith(color: AppColors.cblack),
          ),
          Text(
            info[2],
            style: AppFonts.profileinfo.copyWith(color: AppColors.cblack),
          )
        ],
      ),
    );
  }
}
