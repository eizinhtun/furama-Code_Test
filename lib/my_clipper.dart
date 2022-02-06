import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0 + size.width * 0.1, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width - size.width * 0.1, size.height);
    path_0.lineTo(0, size.height);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
