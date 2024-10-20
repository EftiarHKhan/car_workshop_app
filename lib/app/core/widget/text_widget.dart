import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  String text;
  TextAlign? textAlign;
  Color? textColor;
  double? size;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  int? maxLine;
  TextDecoration? textDecoration;
  String? fontFamily;
  double? height;
  bool? customStyle;

  TextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.textColor,
    this.size,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.textDecoration,
    this.fontFamily,
    this.height,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (text.startsWith('<p>') && text.endsWith('</p>')) {
      text = text.replaceAll('<p>', '');
      text = text.replaceAll('</p>', '');
    }
    return Text(
      text,
      textScaleFactor: 1,
      textAlign: textAlign,
      maxLines: maxLine,
      style: customStyle == true
          ? TextStyle(
              color: textColor ?? Colors.black,
              fontSize: size,
              fontWeight: fontWeight,
              overflow: textOverflow,
              decoration: textDecoration,
              fontFamily: fontFamily ?? 'Poppins',
              height: height,
              letterSpacing: 0,
            )
          : GoogleFonts.jost(
              fontSize: size,
              color: textColor ?? Colors.black,
              fontWeight: fontWeight,
              height: height,
            ),
    );
  }
}
