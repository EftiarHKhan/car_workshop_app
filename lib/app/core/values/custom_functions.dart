import 'package:flutter/material.dart';

InputDecoration primaryInputDecoration({
  String? hintText,
  String? labelText,
  IconData? prefixIcon,
  Widget? suffixIcon,
  EdgeInsetsGeometry? contentPadding = const EdgeInsets.symmetric(
    vertical: 8,
    horizontal: 16,
  ),
  bool enabledBorder = true,
  Color? borderColor,
  double containerBorderRadius = 8.0,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xFF969696),
        fontWeight: FontWeight.w400,
        fontFamily: 'Jost',
        height: 1.2),
    labelText: labelText,
    labelStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFF989898),
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
    prefixIcon: prefixIcon != null
        ? Icon(
            prefixIcon,
            size: 20,
            color: const Color(0xFF969696),
          )
        : null,
    suffixIcon: suffixIcon,
    suffixIconConstraints: const BoxConstraints(),
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: contentPadding ?? EdgeInsets.zero,
    border: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF989898),
      ),
    ),
    enabledBorder: enabledBorder == true
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B05FA).withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(containerBorderRadius),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF989898),
            ),
          ),
    focusedBorder: enabledBorder == true
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B05FA).withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(containerBorderRadius),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF989898),
            ),
          ),
    errorBorder: enabledBorder == true
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFFEBF0FF),
            ),
            borderRadius: BorderRadius.circular(containerBorderRadius),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF989898),
            ),
          ),
    focusedErrorBorder: enabledBorder == true
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B05FA).withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(containerBorderRadius),
          )
        : const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF989898),
            ),
          ),
    /*errorText: errorText == null
                  ? null
                  : isFieldValid.value
                      ? ''
                      : errorText,*/
  );
}
