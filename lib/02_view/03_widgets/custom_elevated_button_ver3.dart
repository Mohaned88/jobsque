import 'package:flutter/material.dart';

import '../05_styles/colors.dart';



class CustomElevatedButtonVer3 extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final AlignmentGeometry? alignment;
  final Widget? icon;
  final Color? iconColor;
  final Color? borderColor;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? suffixIcon;
  final Color? suffixIconColor;


  const CustomElevatedButtonVer3({
    Key? key,
    this.width,
    this.height,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.borderRadius,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.alignment,
    this.icon,
    this.iconColor,
    this.borderColor = AppColors.kPrimaryColor,
    this.mainAxisAlignment,
    this.suffixIcon,
    this.suffixIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 2),
            side: BorderSide(
              color: borderColor!,
            ),
          ),
          alignment: alignment ?? Alignment.centerLeft,
        ),
        icon: icon!,
        label: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: labelColor ?? Colors.white,
                fontSize: labelFontSize ?? 15,
                fontWeight: labelFontWeight ?? FontWeight.normal,
              ),
            ),
            Icon(
              suffixIcon,
              color: suffixIconColor,
            ),
          ],
        ),
      ),
    );
  }
}