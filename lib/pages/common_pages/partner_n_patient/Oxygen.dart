import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circle_progress/circle_oxygen.dart';

import '../../../themes.dart';

class OxygenMain extends StatefulWidget {
  @override
  _OxygenMainState createState() => _OxygenMainState();
}

class _OxygenMainState extends State<OxygenMain> {
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
                  text: 'Oxygen',
                  arrowcolor: AppColors.clightGreen,
                  icon: 'oxygen-tank',
                ),
              ],
            ),
            SizedBox(height: 32),
            RadialProgressOxygen(
              size: size,
              value: '95%',
              duration: 4,
              figure: 'water-drop_1',
              figureH: size.width * 0.2,
              figureW: size.width * 0.2,
              condition:
                  'Your blood oxygen level is normal', //change it with data from back end
              advice: '''You’re doing great, If you keep this up 
you’re goingto live long healthy life ...''', //change it with data from back end
            ),
          ],
        ),
      ),
    );
  }
}
