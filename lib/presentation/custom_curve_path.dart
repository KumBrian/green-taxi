import 'package:flutter/material.dart';

class CustomCurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.75); // Start at the bottom-left, slightly up

    var firstControlPoint = Offset(size.width * 0.3, size.height);
    var firstEndPoint = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0); // Line to top-right
    path.close(); // Close the path to form a shape
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return false if the shape doesn't change
  }
}
