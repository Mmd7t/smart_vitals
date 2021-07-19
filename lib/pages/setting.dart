import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/heart_beat.dart';

import '../themes.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List settings = ['Lisence', 'Help', 'How to use', 'Log out'];
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GradientBox(
                size: size.height * 0.22,
                radius: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TitleText(
                  text: 'Settings',
                  arrowcolor: AppColors.cdarkwhite,
                  withicon: false,
                  gradienttext: false,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 56),
            child: ListOFSettings(
              settings: settings,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          GrayLine(size: size),
          SizedBox(
            height: 24,
          ),
          Center(
            child: Column(
              children: [
                CustomPaint(
                  painter: HeartBeat(
                      color1: AppColors.cDarkblue,
                      color2: AppColors.clightGreen,
                      color3: AppColors.clightGreen,
                      isWhite: true),
                  child: SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.1,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Smart Vitals V 1.2',
                  style: AppFonts.buttonText.copyWith(color: AppColors.cblack),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListOFSettings extends StatelessWidget {
  const ListOFSettings({
    Key key,
    @required this.settings,
  }) : super(key: key);
  final List settings;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          highlightColor: AppColors.cdarkwhite,
          splashColor: AppColors.cdarkwhite,
          onTap: () {},
          child: Text(
            settings[0],
            style: AppFonts.buttonText.copyWith(
              color: AppColors.cblack,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            settings[1],
            style: AppFonts.buttonText.copyWith(
              color: AppColors.cblack,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            settings[2],
            style: AppFonts.buttonText.copyWith(
              color: AppColors.cblack,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            settings[3],
            style: AppFonts.buttonText.copyWith(
              color: AppColors.cblack,
            ),
          ),
        ),
      ],
    );
  }
}
