import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter(
      {this.animation,
      this.fillColor,
      this.fillGradient,
      this.ringColor,
      this.ringGradient,
      this.strokeWidth,
      this.strokeCap,
      this.outerStrokeColor,
      this.backgroundGradient})
      : super(repaint: animation);

  final Animation<double> animation;
  final Color fillColor, ringColor, outerStrokeColor;
  final double strokeWidth;
  final StrokeCap strokeCap;
  final Gradient fillGradient, ringGradient, backgroundGradient;

  @override
  void paint(Canvas canvas, Size size) {
    Paint blurPaint = Paint()
      ..color = ringColor
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 5)
      ..style = PaintingStyle.stroke;
    Paint strokePaint = Paint()
      ..color = ringColor.withOpacity(0.8)
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;
    Paint neumorphicPaint = Paint()
      ..color = outerStrokeColor
      ..strokeWidth = strokeWidth + 4
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;
    Paint innerPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 4);

    if (ringGradient != null) {
      final rect = Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.width / 2);
      blurPaint..shader = ringGradient.createShader(rect);
    } else {
      blurPaint..shader = null;
    }

    double progress = (animation.value) * 2 * math.pi;

    if (fillGradient != null) {
      final rect = Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.width / 2);
      strokePaint..shader = fillGradient.createShader(rect);
    } else {
      strokePaint..shader = null;
      strokePaint.color = fillColor;
    }
    Path path = Path();

    path.addArc(Offset.zero & size, math.pi * 1.5, progress);
    canvas.drawPath(
        Path()..addArc(Offset.zero & size, 0, math.pi * 2), neumorphicPaint);
    canvas.drawPath(
        Path()..addArc(Offset.zero & size, 0, math.pi * 2), innerPaint);

    canvas.drawPath(path, strokePaint);
    canvas.drawPath(path, blurPaint);

    if (outerStrokeColor != null || backgroundGradient != null) {
      final backgroundPaint = Paint();

      if (backgroundGradient != null) {
        final rect = Rect.fromCircle(
            center: size.center(Offset.zero), radius: size.width / 2.2);
        backgroundPaint..shader = backgroundGradient.createShader(rect);
      } else {
        backgroundPaint.color = outerStrokeColor;
      }
    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        ringColor != old.ringColor ||
        fillColor != old.fillColor;
  }
}
