import 'package:flutter/material.dart';

class HeartBeat extends CustomPainter {
  HeartBeat({this.color1, this.color2, this.color3, this.isWhite});

  final Color color1;
  final Color color2;
  final Color color3;
  final bool isWhite;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    Path path = Path();
    isWhite
        ? paint.shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
            colors: [color1, color2]).createShader(Rect.fromCircle(
            center: Offset(size.width / 8, size.width / 8),
            radius: size.width / 2,
          ))
        : paint.shader = LinearGradient(
            stops: [0.1, 0.5, 0.9],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color1.withOpacity(0.01),
              color2,
              color3.withOpacity(0.01)
            ]).createShader(Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width * 0.68,
          ));

    // Path number 1

    path = Path();
    path.moveTo(0, size.height * 0.62);
    path.cubicTo(0, size.height * 0.62, size.width * 0.31, size.height * 0.62,
        size.width * 0.31, size.height * 0.62);
    path.cubicTo(size.width * 0.31, size.height * 0.62, size.width * 0.41,
        size.height * 0.04, size.width * 0.41, size.height * 0.04);
    path.cubicTo(size.width * 0.41, size.height * 0.04, size.width * 0.49,
        size.height * 1.04, size.width * 0.49, size.height * 1.04);
    path.cubicTo(size.width * 0.49, size.height * 1.04, size.width * 0.63,
        size.height * 0.26, size.width * 0.63, size.height * 0.26);
    path.cubicTo(size.width * 0.63, size.height * 0.26, size.width * 0.68,
        size.height * 0.62, size.width * 0.68, size.height * 0.62);
    path.cubicTo(size.width * 0.68, size.height * 0.62, size.width,
        size.height * 0.62, size.width, size.height * 0.62);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
