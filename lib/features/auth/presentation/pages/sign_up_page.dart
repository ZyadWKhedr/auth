import 'package:auth/core/utils/input_validator.dart';
import 'package:auth/features/auth/presentation/providers/auth_provider.dart';
import 'package:auth/features/auth/presentation/widgets/animated_button.dart';
import 'package:auth/features/auth/presentation/widgets/or_divider.dart';
import 'package:auth/features/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:auth/features/auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  void _signup() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();

    final nameValidation = InputValidator.validateName(name);
    final emailValidation = InputValidator.validateEmail(email);
    final passwordValidation = InputValidator.validatePassword(password);

    setState(() {
      _nameError = nameValidation;
      _emailError = emailValidation;
      _passwordError = passwordValidation;
    });

    if (emailValidation == null && passwordValidation == null) {
      await ref.read(authStateProvider.notifier).signUp(name, email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authStateProvider);
    final isLoading = state.isLoading;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInputField(
          hintText: 'Name',
          controller: _nameController,
          errorText: _nameError,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          onChanged: (_) {
            setState(() {
              _emailError = null;
            });
          },
        ),
        SizedBox(height: 16.h),

        TextInputField(
          hintText: 'Email',
          controller: _emailController,
          errorText: _emailError,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (_) {
            setState(() {
              _emailError = null;
            });
          },
        ),
        const SizedBox(height: 16),

        TextInputField(
          hintText: 'Password',
          controller: _passwordController,
          errorText: _passwordError,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onChanged: (_) {
            setState(() {
              _passwordError = null;
            });
          },
        ),
        SizedBox(height: 32.h),

        /// Login Button
        AnimatedButton(
          onTap: isLoading ? null : _signup,
          borderRadius: BorderRadius.circular(12),
          backgroundColor: const Color(0xffF5D973),
          child: Center(
            child: Text(
              isLoading ? 'Signing Up...' : 'Sign UP',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.black),
            ),
          ),
        ),
        OrDivider(),
        SocialAuthButtons(onGooglePressed: () {}, onFacebookPressed: () {}),
        SizedBox(height: 50.h),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
