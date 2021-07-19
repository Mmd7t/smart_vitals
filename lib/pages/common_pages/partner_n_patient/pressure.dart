import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circule_progress.dart';

import '../../../themes.dart';

class PressureMain extends StatefulWidget {
  @override
  _PressureMainState createState() => _PressureMainState();
}

class _PressureMainState extends State<PressureMain> {
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
                  text: 'Blood Pressure',
                  arrowcolor: AppColors.clightGreen,
                  // gradienttext: true,
                  // withicon: true,
                  icon: 'blood-pressure',
                ),
              ],
            ),
            SizedBox(height: 32),
            RadialProgress(
              size: size,
              value: '120/\n  80',
              duration: 4,
              figure: 'pressure_1',
              figureH: 71,
              figureW: 411,
              condition:
                  'Your pressure is normal', //change it with data from back end
              advice: '''You’re doing great, If you keep this up 
you’re goingto live long healthy life ...''', //change it with data from back end
            ),
          ],
        ),
      ),
    );
  }
}
