import 'package:flutter/material.dart';

class TopShape extends CustomClipper<Path> {
  final AnimationController controller;

  TopShape({required this.controller}) : super(reclip: controller);

  static Widget draw({
    required Color color,
    required String text,
    required AnimationController controller,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ClipPath(
          clipper: TopShape(controller: controller),
          child: ColoredBox(
            color: color,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 80),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    // First path line using Tween for height
    path.lineTo(
      0,
      Tween<double>(
        begin: 0,
        end: size.height * 0.7655502392344498,
      ).animate(controller).value,
    );

    // Adjusting all height * values inside Tween
    path.cubicTo(
      size.width * 0.03333333333333333,
      Tween<double>(
        begin: 0,
        end: size.height * 0.6842105263157895,
      ).animate(controller).value,
      size.width * 0.1282051282051282,
      Tween<double>(
        begin: 0,
        end: size.height * 0.5598086124401914,
      ).animate(controller).value,
      size.width * 0.22564102564102564,
      Tween<double>(
        begin: 0,
        end: size.height * 0.6650717783349283,
      ).animate(controller).value,
    );

    path.cubicTo(
      size.width * 0.34358974359,
      Tween<double>(
        begin: 0,
        end: size.height * 0.7942583732,
      ).animate(controller).value,
      size.width * 0.3923876923,
      Tween<double>(
        begin: 0,
        end: size.height * 0.81818181818,
      ).animate(controller).value,
      size.width * 0.45128285128,
      Tween<double>(
        begin: 0,
        end: size.height * 0.74641148325,
      ).animate(controller).value,
    );

    path.cubicTo(
      size.width * 0.5128205128205128,
      Tween<double>(
        begin: 0,
        end: size.height * 0.6746411483253588,
      ).animate(controller).value,
      size.width * 0.5692387692307692,
      Tween<double>(
        begin: 0,
        end: size.height * 0.41626794258373206,
      ).animate(controller).value,
      size.width * 0.6423076923076924,
      Tween<double>(
        begin: 0,
        end: size.height * 0.5933014354866986,
      ).animate(controller).value,
    );

    path.cubicTo(
      size.width * 0.7153846153846154,
      Tween<double>(
        begin: 0,
        end: size.height * 0.7783349282296651,
      ).animate(controller).value,
      size.width * 0.7256410256410256,
      size.height,
      size.width * 0.7871794871794872,
      size.height,
    );

    path.cubicTo(
      size.width * 0.8487179487179487,
      size.height,
      size.width * 0.8974358974358975,
      Tween<double>(
        begin: 0,
        end: size.height * 0.6220095693779985,
      ).animate(controller).value,
      size.width,
      Tween<double>(
        begin: 0,
        end: size.height * 0.7129186602870813,
      ).animate(controller).value,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant TopShape oldClipper) {
    return oldClipper.controller.value != controller.value;
  }
}
