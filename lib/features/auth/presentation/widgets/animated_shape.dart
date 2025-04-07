import 'package:flutter/material.dart';
import 'top_shape.dart'; // Ensure this is the correct import for TopShape

class AnimatedShape extends StatefulWidget {
  final Color color;
  final String title;
  final bool show;

  const AnimatedShape({
    super.key,
    required this.color,
    required this.title,
    this.show = true,
  });

  @override
  State<AnimatedShape> createState() => _AnimatedShapeState();
}

class _AnimatedShapeState extends State<AnimatedShape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward(); // Start the animation
  }

  @override
  void didUpdateWidget(covariant AnimatedShape oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show != oldWidget.show) {
      // When 'show' changes, we control the animation
      if (widget.show) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 200,
      ), // Smooth transition for position
      top:
          widget.show
              ? 0
              : -230, // If `show` is true, widget stays in place, else it moves up
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: widget.show ? 1.0 : 0.0, // Animate opacity
        duration: const Duration(
          milliseconds: 100,
        ), // Customize the fade duration
        child: SizedBox(
          width: double.infinity,
          height: 230,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return TopShape.draw(
                color: widget.color,
                text: widget.title,
                controller: _controller,
              );
            },
          ),
        ),
      ),
    );
  }
}
