import 'dart:ui';

import 'package:caderno_de_desenho/entitys/custom_point.dart';
import 'package:flutter/material.dart';

class CadernoPainter extends CustomPainter {
  final List<CustomPoint> points;

  const CadernoPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i].offset,
          points[i + 1].offset,
          paint..color = points[i].color,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [points[i].offset],
          paint..color = points[i].color,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
