import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/circle_progress/circle_glucose.dart';

import '../../../themes.dart';

class GlucoseMain extends StatefulWidget {
  @override
  _GlucoseMainState createState() => _GlucoseMainState();
}

class _GlucoseMainState extends State<GlucoseMain> {
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
                  text: 'Glucose',
                  arrowcolor: AppColors.clightGreen,
                  // gradienttext: true,
                  // withicon: true,
                  icon: 'glucometer',
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            RadialProgressGlucose(
              size: size,
              value: '  140\nmg/dL',
              duration: 4,
              figure: 'suger',
              figureH: size.width * 0.22,
              figureW: size.width * 0.22,
              condition:
                  'Your glucose is normal', //change it with data from back end
              advice: '''You’re doing great, If you keep this up 
you’re goingto live long healthy life ...''', //change it with data from back end
            ),
          ],
        ),
      ),
    );
  }
}
