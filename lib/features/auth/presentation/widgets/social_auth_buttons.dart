import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        _buildSocialButton(
          onTap: onGooglePressed,
          icon: FontAwesomeIcons.google,
          color: Colors.red,
        ),
        SizedBox(width: 80.w), // Responsive spacing
        // Facebook Button
        _buildSocialButton(
          onTap: onFacebookPressed,
          icon: FontAwesomeIcons.facebook,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w, // Fixed responsive width
        height: 60.h, // Fixed responsive height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r), // Responsive radius
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10.r, // Responsive blur
              spreadRadius: 2.r, // Responsive spread
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: color,
            size: 24.sp, // Responsive icon size
          ),
        ),
      ),
    );
  }
}
