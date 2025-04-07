import 'package:flutter/material.dart';

class AuthSwitchButton extends StatelessWidget {
  const AuthSwitchButton({
    super.key,
    required this.showSignIn,
    required this.onTap,
  });

  final bool showSignIn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 80,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                showSignIn
                    ? "Don't have an account?"
                    : "Already have an account?",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 8),
              Text(
                showSignIn ? "Sign Up" : "Sign In",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
