import 'dart:math' as math;
import 'package:flutter/material.dart';

class LiquidBackground extends StatefulWidget {
  final Widget child;
  const LiquidBackground({super.key, required this.child});

  @override
  State<LiquidBackground> createState() => _LiquidBackgroundState();
}

class _LiquidBackgroundState extends State<LiquidBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: LiquidPainter(_controller.value),
              size: Size.infinite,
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class LiquidPainter extends CustomPainter {
  final double animationValue;
  LiquidPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

    // Dynamic blobs
    _drawBlob(canvas, size, paint, const Color(0xFF9181EE).withOpacity(0.6), 
        0.2, 0.3, 0.4 + 0.1 * math.sin(animationValue * 2 * math.pi));
    
    _drawBlob(canvas, size, paint, const Color(0xFF81C7EE).withOpacity(0.5), 
        0.7, 0.6, 0.35 + 0.12 * math.cos(animationValue * 2 * math.pi));
    
    _drawBlob(canvas, size, paint, const Color(0xFFB181EE).withOpacity(0.4), 
        0.4, 0.8, 0.45 + 0.08 * math.sin(animationValue * 2 * math.pi + 1));
  }

  void _drawBlob(Canvas canvas, Size size, Paint paint, Color color, 
      double relX, double relY, double relRadius) {
    paint.color = color;
    canvas.drawCircle(
      Offset(size.width * relX, size.height * relY),
      size.width * relRadius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant LiquidPainter oldDelegate) => true;
}
