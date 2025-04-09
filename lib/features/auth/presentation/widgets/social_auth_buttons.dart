import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialAuthButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialAuthButtons({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Sizes relative to screen width
    final buttonSize = screenWidth * 0.14;
    final iconSize = screenWidth * 0.06;
    final spacing = screenWidth * 0.2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          size: buttonSize,
          iconSize: iconSize,
          onTap: onGooglePressed,
          icon: FontAwesomeIcons.google,
          color: Colors.red,
        ),
        SizedBox(width: spacing),
        _buildSocialButton(
          size: buttonSize,
          iconSize: iconSize,
          onTap: onFacebookPressed,
          icon: FontAwesomeIcons.facebook,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required double size,
    required double iconSize,
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size * 0.33),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(child: FaIcon(icon, color: color, size: iconSize)),
      ),
    );
  }
}
