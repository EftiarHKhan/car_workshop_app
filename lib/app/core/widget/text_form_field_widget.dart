import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType keyboardType;

  const TextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.validator,
    super.key,
    this.obscureText = false,
    this.suffix,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFFA4A1AA).withOpacity(0.8),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: const Color(0xFF8B05FA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: const Color(0xFF8B05FA),
          ),
        ),
      ),
      validator: validator,
      obscureText: obscureText,
      keyboardType:keyboardType,
    );
  }
}
