import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/card.dart';

import '../../../themes.dart';

class HeartRateMeasure extends StatefulWidget {
  const HeartRateMeasure({Key key}) : super(key: key);

  @override
  _HeartRateMeasureState createState() => _HeartRateMeasureState();
}

class _HeartRateMeasureState extends State<HeartRateMeasure> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavBar(size: size),
      backgroundColor: AppColors.cdarkwhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, left: 0, bottom: 48),
              child: TitleText(
                text: 'Heart Rate',
                arrowcolor: AppColors.clightGreen,
                icon: 'heart-rate-monitor',
              ),
            ),
            Center(
              child: Text(
                'Measurement\n        History',
                style: AppFonts.buttonText.copyWith(color: AppColors.cblack),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // you should use Cubit to generate a list of MyCard acorrding to Back end data
            // all Mycard data should be replaced with Backend data
            MyCard(
              AM_PM: 'AM',
              time: '2:00',
              date: 'Today',
              measure: '100 Bpm',
            ),
          ],
        ),
      ),
    );
  }
}
