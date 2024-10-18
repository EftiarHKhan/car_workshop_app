import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class InputFieldOne extends StatelessWidget {
  var textController = TextEditingController().obs;
  String? title;
  String? subTitle;
  String? hint;
  String? lable;
  String? errorText;
  IconData? prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool isRequired;
  bool? activePassword;
  TextInputAction? textInputAction;
  bool? enabledBorder;
  EdgeInsetsGeometry? contentPadding;
  int? lines;
  Color? borderColor;

  InputFieldOne({
    super.key,
    required this.textController,
    this.title,
    this.subTitle,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.lable,
    this.errorText,
    this.validator,
    this.keyboardType,
    required this.isRequired,
    this.activePassword,
    this.textInputAction,
    this.enabledBorder,
    this.contentPadding,
    this.lines,
    this.borderColor,
  });

  var isFieldValid = true.obs;
  double containerBorderRadius = 30.0;
  final Rx<bool> _obscurePassword = Rx<bool>(true);

  void _togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF202020),
                fontWeight: FontWeight.w700,
                fontFamily: 'Noto Serif Bengali',
                height: 1.5,
              ),
            ),
            Text(
              subTitle ?? '',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6A6A6A),
                fontWeight: FontWeight.w400,
                fontFamily: 'Noto Serif Bengali',
                height: 1.2,
              ),
            ),
          ],
        ),
        8.height,
        TextFormField(
          controller: textController.value,
          textInputAction: textInputAction ?? TextInputAction.done,
          maxLines: lines ?? 1,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              isFieldValid.value = false;
              //return errorText ?? 'This field is required';
            } else {
              isFieldValid.value = true;
              return null;
            }
            return null;
          },
          onChanged: (value) {
            if (isRequired && (value.isEmpty)) {
              isFieldValid.value = false;
            } else {
              isFieldValid.value = true;
            }
          },
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: activePassword == true ? _obscurePassword.value : false,
          cursorColor:
              isFieldValid.value ? Color(0xFF202020) : Color(0xFF202020),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF202020),
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xFF969696),
              fontWeight: FontWeight.w400,
              fontFamily: 'Jost',
              height: 1.5,
            ),
            labelText: lable,
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
                    color: const Color(0xFF667085),
                  )
                : null,
            suffixIcon: activePassword == true
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: _togglePasswordVisibility,
                          child: Container(
                            margin: const EdgeInsets.only(left: 0, right: 12),
                            padding: EdgeInsets.zero,
                            child: Icon(
                              _obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,
                              color: isFieldValid.value == true
                                  ? const Color(0xFF202020)
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : suffixIcon,
            suffixIconConstraints: const BoxConstraints(),
            filled: true,
            fillColor: Colors.white,
            contentPadding: contentPadding ?? EdgeInsets.zero,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF989898),
              ),
            ),
            enabledBorder: enabledBorder == true
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ??
                          const Color(0xFF8B05FA).withOpacity(0.1),
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
                      color: borderColor ??
                          const Color(0xFF8B05FA).withOpacity(0.1),
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
                      color: borderColor ??
                          const Color(0xFF8B05FA).withOpacity(0.1),
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
          ),
        ),
        isRequired
            ? Text(
                '${errorText == null ? '' : (
                    isFieldValid.value ? '' : errorText,
                  )}',
                style: TextStyle(
                  fontSize: 12,
                  color: isFieldValid.value ? Colors.transparent : Colors.red,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              )
            : Container(),
      ],
    );
  }
}
