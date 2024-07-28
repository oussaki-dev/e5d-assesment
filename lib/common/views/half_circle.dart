import 'package:flutter/material.dart';

enum CirclePosition { left, right, top }

class HalfCirclePainter extends CustomPainter {
  HalfCirclePainter(this.color, this.circlePosition);

  Color color;
  CirclePosition circlePosition;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTRB(-size.width / 2, 0, size.width / 2, size.height);

    var startAngle = (3 * 3.14) / 2;

    switch (circlePosition) {
      case CirclePosition.right:
        rect = Rect.fromLTRB(-size.width / 2, 0, size.width / 2, size.height);
        startAngle = (3 * 3.14) / 2; // Start from 3 PI / 2
        break;
      case CirclePosition.left:
        rect = Rect.fromLTRB(size.width / 2, 0, size.width * 2, size.height);
        startAngle = 3.14 / 2; // start from PI / 2

      case CirclePosition.top:
        rect = Rect.fromLTRB(0, size.height / 2, size.width, size.height * 2);
        startAngle = 3.14; // start from PI / 2

      default:
        startAngle = (3 * 3.14) / 2;
    }

    const sweepAngle = 3.14; // Draw half circle

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
