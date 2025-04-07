import 'package:auth/features/auth/presentation/widgets/animated_button.dart';
import 'package:auth/features/auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputField(
          hintText: 'Email',
          obscureText: false,
          onChanged: (String value) {},
        ),
        TextInputField(
          hintText: 'Password',
          obscureText: true,
          onChanged: (String value) {},
        ),
        AnimatedButton(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffF5D973),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
