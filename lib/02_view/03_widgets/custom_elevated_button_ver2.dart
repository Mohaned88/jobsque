import 'package:flutter/material.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';

class CustomElevatedButtonVer2 extends StatelessWidget {
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
  final IconData? icon;
  final Color? iconColor;
  final Color? borderColor;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? suffixIcon;
  final Color? suffixIconColor;


  const CustomElevatedButtonVer2({
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
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 2),
            side: BorderSide(
              color: borderColor!,
            ),
          ),
          alignment: alignment ?? Alignment.centerLeft,
        ),
        icon: Icon(icon,color: iconColor,),
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
