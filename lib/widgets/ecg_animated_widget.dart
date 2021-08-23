import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../themes.dart';
import 'Gradient_text.dart';
import 'Gray_line.dart';

class ECGAnmitedWidget extends StatelessWidget {
  ECGAnmitedWidget({
    Key key,
    @required this.size,
    this.figure,
    this.advice,
    this.condition,
    this.figureH,
    this.figureW,
  }) : super(key: key);

  final Size size;
  final String figure;
  final String advice;
  final String condition;
  final double figureH;
  final double figureW;

  List<testData> _testData;

  @override
  Widget build(BuildContext context) {
    _testData = getTestData();
    return DelayedDisplay(
      delay: Duration(microseconds: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8,
          ),
          GradientText(
            text: 'Click the circle to measure again',
            font: AppFonts.profile,
          ),
          SizedBox(
            height: 5,
          ),
          GrayLine(size: size),
          SizedBox(
            height: 1,
          ),
          Container(
            height: size.height / 3,
            child: SfCartesianChart(
              enableAxisAnimation: true,
              series: <LineSeries<testData, double>>[
                LineSeries<testData, double>(
                  dataSource: _testData,
                  xValueMapper: (testData data, _) => data.x,
                  yValueMapper: (testData data, _) => data.y
                ),
              ],
              primaryXAxis: NumericAxis(
                minimum: 0,
                maximum: 20,
                isVisible: true,
                decimalPlaces: 7,
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 1000,
                isVisible: true,
                decimalPlaces: 5,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Our advice to you',
            style: AppFonts.captiontext.copyWith(
              color: Colors.black,
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Center(
              child: Text(
                advice,
                style: AppFonts.captiontext.copyWith(color: AppColors.cblack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<testData> getTestData() {
  final List<testData> TestData = [
    testData(1, 120),
    testData(2, 200),
    testData(3, 150),
    testData(4, 190),
    testData(6, 120),
    testData(7, 220),
    testData(8, 290),
    testData(9, 260),
    testData(10, 300),
    testData(11, 600),
    testData(12, 530),
    testData(13, 700),
    testData(14, 620),
    testData(15, 320),
    testData(16, 400),
    testData(17, 500),
    testData(18, 800),
    testData(19, 820),
    testData(20, 620),
  ];
  return TestData;
}

class testData {
  final double x;
  final double y;
  testData(this.x, this.y);
}
