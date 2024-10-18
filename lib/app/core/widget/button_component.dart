import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ButtonComponent extends StatelessWidget {
  IconData? icon;
  String? imagePath;
  String text;
  VoidCallback ontap;
  Color? buttonColor;
  Color? iconColor;
  double? iconSize;
  Color? textColor;
  double? buttonHeight;
  double? buttonHeightSolid;
  double? buttonWidth;
  bool? activeOutline;
  double? textSize;
  FontWeight? fontWeight;
  Alignment? alignment;
  TextAlign? textAlignment;
  double? contentPaddingHorizontal;
  double? buttonBorderRadius;
  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  double? imageSize;

  ButtonComponent({
    super.key,
    this.icon,
    this.imagePath,
    required this.text,
    required this.ontap,
    this.buttonColor,
    this.iconColor,
    this.iconSize,
    this.textColor,
    this.buttonHeight,
    this.buttonHeightSolid,
    this.buttonWidth,
    this.activeOutline,
    this.textSize,
    this.fontWeight,
    this.alignment,
    this.textAlignment,
    this.contentPaddingHorizontal,
    this.buttonBorderRadius,
    this.boxShadow,
    this.gradient,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: contentPaddingHorizontal ?? 16),
        height: buttonHeightSolid != null
            ? buttonHeightSolid
            : Get.height * (buttonHeight ?? .06),
        width: buttonWidth,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonBorderRadius ?? 8),
          color: activeOutline == true
              ? Colors.transparent
              : buttonColor ?? const Color(0xFF8B05FA),
          border: Border.all(
            color: activeOutline == true
                ? buttonColor ?? const Color(0xFF8B05FA)
                : Colors.transparent,
          ),
          gradient: gradient,
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: imagePath != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            imagePath != null
                ? Image.asset(
                    imagePath!,
                    height: imageSize,
                    width: imageSize,
                  )
                : Container(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          size: iconSize ?? 24,
                          color: iconColor,
                        )
                      : Container(),
                  icon != null ? 4.width : Container(),
                  Text(
                    text,
                    textAlign: textAlignment,
                    style: TextStyle(
                      color: textColor ??
                          (activeOutline == true
                              ? const Color(0xFF8B05FA)
                              : Colors.white),
                      fontSize: textSize ?? 14,
                      fontWeight: fontWeight ?? FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
