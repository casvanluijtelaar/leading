import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leading/app/utils/canvas_utils.dart';

class AnimationIndicator extends StatefulWidget {
  AnimationIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  _AnimationIndicatorState createState() => _AnimationIndicatorState();
}

class _AnimationIndicatorState extends State<AnimationIndicator>
    with TickerProviderStateMixin {
  late Animation<int> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final tween = StepTween(begin: 0, end: 40);

    animation = tween.animate(controller)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          controller.repeat();
        else if (status == AnimationStatus.dismissed) controller.forward();
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: ShapePainter(
              widget.color,
              animation.value,
            ),
            child: Container(),
          );
        },
      );
}

class ShapePainter extends CustomPainter {
  const ShapePainter(this.color, this.status);

  final Color color;
  final int status;

  final ledSize = 3;
  final hallwaySize = 50;
  final ledspacing = 9;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final hallwayleft = (width / 2) - (hallwaySize / 2);
    final hallwayright = (width / 2) + (hallwaySize / 2);

    final hallway1Top = (height / 3) - (hallwaySize / 2);
    final hallway1Bottom = (height / 3) + (hallwaySize / 2);

    final hallway2Top = (height - (height / 3)) - (hallwaySize / 2);
    final hallway2Bottom = (height - (height / 3)) + (hallwaySize / 2);

    final borderPaint = Paint()
      ..color = const Color.fromRGBO(200, 200, 200, 1)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    ///               hallwayleft      hallwayright
    ///                         │      │
    ///                         │      │
    ///                         │      │
    /// hallway1top         ────┘      └────
    ///
    /// hallway1bottom      ────┐      ┌────
    ///                         │      │
    ///                         │      │        drawing all lines
    ///                         │      │
    /// hallway2top         ────┘      └────
    ///
    /// hallway2bottom      ────┐      ┌────
    ///                         │      │
    ///                         │      │
    ///                         │      │

    /// drawing wall lines
 

    canvas
      ..drawLine(
        Offset(hallwayleft, 0),
        Offset(hallwayleft, hallway1Top),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, 0),
        Offset(hallwayright, hallway1Top),
        borderPaint,
      )
      ..drawLine(
        Offset(0, hallway1Top),
        Offset(hallwayleft, hallway1Top),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway1Top),
        Offset(width, hallway1Top),
        borderPaint,
      )
      ..drawLine(
        Offset(0, hallway1Bottom),
        Offset(hallwayleft, hallway1Bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway1Bottom),
        Offset(width, hallway1Bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayleft, hallway1Bottom),
        Offset(hallwayleft, hallway2Top),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway1Bottom),
        Offset(hallwayright, hallway2Top),
        borderPaint,
      )
      ..drawLine(
        Offset(0, hallway2Top),
        Offset(hallwayleft, hallway2Top),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway2Top),
        Offset(width, hallway2Top),
        borderPaint,
      )
      ..drawLine(
        Offset(0, hallway2Bottom),
        Offset(hallwayleft, hallway2Bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway2Bottom),
        Offset(width, hallway2Bottom),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayleft, hallway2Bottom),
        Offset(hallwayleft, height),
        borderPaint,
      )
      ..drawLine(
        Offset(hallwayright, hallway2Bottom),
        Offset(hallwayright, height),
        borderPaint,
      );

    ///               hallwayleft      hallwayright
    ///                         │      │
    ///                         │      │
    ///                         │      │
    /// hallway1top         ────┘      └────
    ///                             . . .  <----- drawing  leds
    /// hallway1bottom      ────┐   .  ┌────
    ///                         │   .  │
    ///                         │      │
    ///                         │   .  │
    /// hallway2top         ────┘   .  └────
    ///                          ....     <----- drawing  leds
    /// hallway2bottom      ────┐      ┌────
    ///                         │      │
    ///                         │      │
    ///                         │      │

    final start1 = Offset(width / 4, hallway2Top + (hallwaySize / 2));
    final middle1 = Offset(width / 2, hallway2Top + (hallwaySize / 2));
    final end1 = Offset(width / 2, hallway2Top - (hallwaySize / 2));

    final start2 = Offset(width / 2, hallway1Bottom + (hallwaySize / 2));
    final middle2 = Offset(width / 2, hallway1Top + (hallwaySize / 2));
    final end2 = Offset(width * 3 / 4, hallway1Top + (hallwaySize / 2));

    final points = [
      ...CanvasUtils.getIntermedianPoints(start1, middle1, 5),
      ...CanvasUtils.getIntermedianPoints(middle1, end1, 5),
      ...CanvasUtils.getIntermedianPoints(start2, middle2, 5),
      ...CanvasUtils.getIntermedianPoints(middle2, end2, 5),
    ];

    for (var i = 0; i < points.length; i++) {
      final opacity = status == i || status == i - 1 ? 1.0 : 0.3;
      final dotColor = color.withOpacity(opacity);

      final paint = Paint()
        ..color = dotColor
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round;

      canvas.drawCircle(points[i], 3, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
