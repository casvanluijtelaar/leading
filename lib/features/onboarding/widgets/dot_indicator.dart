import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DotIndicator extends StatefulWidget {
  DotIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    final tween = Tween<double>(begin: 0, end: 1);

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
  final double status;

  @override
  void paint(Canvas canvas, Size size) {









final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;




    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
