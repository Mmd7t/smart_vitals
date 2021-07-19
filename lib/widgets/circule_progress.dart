import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import '../themes.dart';
import 'Gradient_text.dart';
import 'animated_Text.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    Key key,
    this.value,
    this.duration,
    this.size,
    this.figure,
    this.advice,
    this.condition,
    this.figureH,
    this.figureW,
  }) : super(key: key);

  final double goalCompleted = 1;
  final String value;
  final int duration;
  final Size size;
  final String figure;
  final String advice;
  final String condition;
  final double figureH;
  final double figureW;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(microseconds: 0);

  double progressDegrees = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.duration));
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    setState(() {
      if (progressDegrees == 0) {
        child = Center(
          child: InkWell(
            highlightColor: AppColors.cdarkwhite,
            splashColor: AppColors.cdarkwhite,
            onTap: () {
              _radialProgressAnimationController.forward();
            },
            child: GradientText(
              text: "Measure",
              font: AppFonts.precentage,
            ),
          ),
        );
      } else if (progressDegrees == 360) {
        child = Center(
          child: InkWell(
            highlightColor: AppColors.cdarkwhite,
            onTap: () {
              setState(() {
                progressDegrees = 0;
                _radialProgressAnimationController.reset();
              });
            },
            child: GradientText(
              text: widget.value,
              font: AppFonts.precentage,
            ),
          ),
        );
      } else {
        child = Lottie.asset('assets/animation/animation.json', repeat: true);
      }
    });

    return Column(
      children: [
        CustomPaint(
          child: Container(
              height: widget.size.width * 0.4,
              width: widget.size.width * 0.4,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: child),
          painter: RadialPainter(progressDegrees),
        ),
        if (progressDegrees == 360)
          AnmitedWidget(
            size: widget.size,
            figure: widget.figure,
            condition: widget.condition,
            advice: widget.advice,
            figureH: widget.figureH,
            figureW: widget.figureW,
          ),
      ],
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.5, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(colors: [
        AppColors.cDarkblue,
        AppColors.clightGreen,
      ]).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
