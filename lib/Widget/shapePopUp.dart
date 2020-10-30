import 'package:flutter/material.dart';

class CustomRoundedRectangleBorder extends ShapeBorder {

  final double borderWidth;
  final BorderRadius borderRadius;

  const CustomRoundedRectangleBorder({
    this.borderWidth: 1.0,
    this.borderRadius: BorderRadius.zero,
  })
      : assert(borderRadius != null);

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(borderWidth);
  }

  @override
  ShapeBorder scale(double t) {
    return new CustomRoundedRectangleBorder(

      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    assert(t != null);
    return new CustomRoundedRectangleBorder(

      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    return new CustomRoundedRectangleBorder(

      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Path getInnerPath(Rect rect, { TextDirection textDirection }) {
    return new Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect).deflate(
          borderWidth));
  }

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    final path = Path()
    ..lineTo(0, 230)
      ..quadraticBezierTo(2, 245, 15, 248)
      ..lineTo(215, 250)
      ..quadraticBezierTo(230, 245, 228, 230)

      ..lineTo(230, 45)
      ..lineTo(250, 35)
      ..lineTo(230, 25)
      ..lineTo(230, 18)
      ..quadraticBezierTo(227, 5, 212, 0)
      ..lineTo(212, 0)
      ..lineTo(15, 0)
      ..quadraticBezierTo(0, 7, 0, 25)
      ..lineTo(0,25)
      ..lineTo(0, 230)
//      ..quadraticBezierTo(200, 100.0, 100, 100)
//      ..close()
    ;
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {
    rect = rect.deflate(borderWidth / 2.0);

    final RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);

  }
}