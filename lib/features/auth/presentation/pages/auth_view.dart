import 'package:auth/features/auth/presentation/pages/login_page.dart';
import 'package:auth/features/auth/presentation/pages/sign_up_page.dart';
import 'package:auth/features/auth/presentation/widgets/animated_shape.dart';
import 'package:auth/features/auth/presentation/widgets/auth_switch_button.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false, // Prevent scaffold body from resizing when keyboard appears
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _showSignIn ? const LoginPage() : const SignUpPage(),
            ),
          ),
          AnimatedShape(color: Color(0xff595DC6), title: 'Create Account'),
          AnimatedShape(
            color: Color(0xffFC5F8E),
            title: 'Welcome Back',
            show: !_showSignIn,
          ),
          AuthSwitchButton(
            showSignIn: _showSignIn,
            onTap: () {
              setState(() {
                _showSignIn = !_showSignIn;
              });
            },
          ),
        ],
      ),
    );
  }
}
