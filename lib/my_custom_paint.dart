import 'package:flutter/material.dart';

class MyParallelPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = const Color(0xff97c0d4);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width * 0.1, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
