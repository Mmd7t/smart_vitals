import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circle_progress/circle_heart_rate.dart';
import '../../../themes.dart';

class HeartRateMain extends StatefulWidget {
  @override
  _HeartRateMainState createState() => _HeartRateMainState();
}

class _HeartRateMainState extends State<HeartRateMain> {
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
                  text: 'Heart Rate',
                  arrowcolor: AppColors.clightGreen,
                  // gradienttext: true,
                  // withicon: true,
                  icon: 'heart-rate-monitor',
                ),
              ],
            ),
            const SizedBox(height: 32),
            RadialProgressHeartRate(
              size: size,
              value: '120\n/80',
              duration: 4,
              figure: 'heart',
              figureH: size.width * 0.2,
              figureW: size.width * 0.2,
              condition:
                  'Your heart rate is not normal', //change it with data from back end
              advice: '''You must go to the hospital!!!!!
   CALL THE EMERGENCY!!!! ''', //change it with data from back end
            ),
          ],
        ),
      ),
    );
  }
}
