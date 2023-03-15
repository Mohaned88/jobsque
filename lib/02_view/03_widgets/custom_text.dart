import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  //--------------------Style
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final String? fontFamily;
  final TextOverflow? overflow;
  final double? height;

  const CustomText({
    Key? key,
    required this.text,
    this.textAlign,
    this.maxLines,
    //--------------------Style
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
    this.fontFamily,
    this.overflow,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        fontFamily: fontFamily,
        overflow: overflow,
        height: height,
      ),
    );
  }
}
