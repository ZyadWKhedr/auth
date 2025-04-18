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
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    // Background shapes
                    AnimatedShape(
                      color: const Color(0xff595DC6),
                      title: 'Welcome back',
                    ),
                    AnimatedShape(
                      color: const Color(0xffFC5F8E),
                      title: 'Create Account',
                      show: !_showSignIn,
                    ),

                    // Content area
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        16,
                        MediaQuery.of(context).size.height * 0.35,
                        16,
                        20,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child:
                            _showSignIn
                                ? const LoginPage()
                                : const SignUpPage(),
                      ),
                    ),

                    // Switch button
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
              ),
            ),
          );
        },
      ),
    );
  }
}
