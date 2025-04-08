import 'package:auth/core/utils/input_validator.dart';
import 'package:auth/features/auth/presentation/providers/auth_provider.dart';
import 'package:auth/features/auth/presentation/widgets/animated_button.dart';
import 'package:auth/features/auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  void _login() async {
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
      await ref.read(authStateProvider.notifier).signIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authStateProvider);
    final isLoading = state.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Email Field
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
              const SizedBox(height: 16),

              /// Email Field
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

              /// Password Field
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
              const SizedBox(height: 32),

              /// Login Button
              AnimatedButton(
                onTap: isLoading ? null : _login,
                splashColor: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                child: Center(
                  child: Text(
                    isLoading ? 'Logging in...' : 'Login',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
