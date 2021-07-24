import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circle_progress/circle_temp.dart';

import '../../../themes.dart';

class TempretureMain extends StatefulWidget {
  @override
  _TempretureMainState createState() => _TempretureMainState();
}

class _TempretureMainState extends State<TempretureMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      bottomNavigationBar: NavBar(size: size),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                GrayLine(
                  size: size,
                  height: size.height * 0.123,
                ),
                TitleText(
                  text: 'Body Temprature',
                  arrowcolor: AppColors.clightGreen,
                  // gradienttext: true,
                  // withicon: true,
                  icon: 'thermometer',
                ),
              ],
            ),
            SizedBox(height: 32),
            RadialProgressTemp(
              size: size,
              value: '37',
              duration: 4,
              figure: 'temp_3',
              figureH: size.width * 0.15,
              figureW: size.width * 0.57,
              condition:
                  'Your temprature is normal', //change it with data from back end
              advice: '''You’re doing great, If you keep this up 
you’re goingto live long healthy life ...''', //change it with data from back end
            ),
          ],
        ),
      ),
    );
  }
}
