import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DashedLinePainter({
    required this.dashWidth,
    required this.dashSpace,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
