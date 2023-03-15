import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String label;
  final Widget icon;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color borderSideColor;
  final double borderSideWidth;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final AlignmentGeometry? alignment;
  const AuthButton({
    Key? key,
    this.width,
    this.height,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.borderRadius,
    this.borderSideColor = Colors.transparent,
    this.borderSideWidth = 0,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.alignment,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 2),
            side: BorderSide(
              color: borderSideColor,
              width: borderSideWidth,
            ),
          ),
          alignment: alignment ?? Alignment.centerLeft,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: labelColor ?? Colors.white,
            fontSize: labelFontSize ?? 15,
            fontWeight: labelFontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
