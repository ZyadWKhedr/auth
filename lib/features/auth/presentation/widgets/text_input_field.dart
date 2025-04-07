import 'package:auth/features/auth/presentation/widgets/size_fade_switcher.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.hintText,
    this.errorText,
    required this.obscureText,
    required this.onChanged,
  });

  final String hintText;
  final String? errorText;
  final bool obscureText;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffD0D0D0)),
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,

              hintText: hintText,

              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffC2C2C2),
              ),
            ),
          ),
        ),
        SizeFadeSwitcher(
          child:
              errorText != null
                  ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      errorText!,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
