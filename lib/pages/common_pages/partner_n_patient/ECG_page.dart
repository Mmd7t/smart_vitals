import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circle_progress/circle_ecg.dart';
import '../../../themes.dart';

class ECGMain extends StatefulWidget {
  @override
  _ECGMainState createState() => _ECGMainState();
}

class _ECGMainState extends State<ECGMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
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
                  text: 'ECG',
                  arrowcolor: AppColors.clightGreen,
                  // gradienttext: true,
                  // withicon: true,
                  icon: 'heart-rate-monitor',
                ),
              ],
            ),
            SizedBox(height: 32),
            RadialProgressECG(
              size: size,
              value: '37',
              duration: 4,
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
