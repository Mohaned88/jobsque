import 'package:flutter/material.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';

class CustomTextFieldVer2 extends StatelessWidget {
  //dimensions
  final double? width;
  final double? height;

  //body
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final bool obscureText;
  final TextAlign textAlign;

  //functions
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;

  //decoration
  final EdgeInsetsGeometry? contentPadding;
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? suffixOnPressed;
  final Widget? prefixIcon;
  final VoidCallback? prefixOnPressed;
  final bool? filled;
  final double? borderRadius;
  final Color? fillColor;
  final Color? hintColor;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final double? hintHeight;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? cursorHeight;
  final Color? cursorColor;
  final TextInputType? keyboardType;

  //control
  final FormFieldValidator? validator;
  ValueChanged<String>? onFieldSubmitted;

  CustomTextFieldVer2({
    super.key,
    //dimensions
    this.width,
    this.height,
    //body
    this.controller,
    this.textDirection,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.cursorHeight = 22,
    this.cursorColor = Colors.black,
    //functions
    this.onTap,
    this.onChanged,
    //decoration
    this.contentPadding,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.suffixOnPressed,
    this.prefixIcon,
    this.prefixOnPressed,
    this.filled = true,
    this.borderRadius = 5,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.fillColor = Colors.white70,
    this.hintColor = Colors.black,
    this.hintFontWeight,
    this.hintFontSize,
    this.hintHeight,
    //control
    this.validator,
    this.keyboardType,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        controller: controller,
        textDirection: textDirection,
        onTap: onTap,
        onChanged: onChanged,
        obscureText: obscureText,
        textAlign: textAlign,
        cursorHeight: cursorHeight,
        cursorColor: cursorColor,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          label: label != null ? Text(label!) : null,
          hintText: hintText ?? "",
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixOnPressed, icon: suffixIcon!)
              : null,
          prefixIcon: prefixIcon != null
              ? IconButton(onPressed: prefixOnPressed, icon: prefixIcon!)
              : null,
          filled: filled,
          fillColor: fillColor,
          hintStyle: TextStyle(
            height: hintHeight,
            color: hintColor,
            fontSize: hintFontSize,
            fontWeight: hintFontWeight,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: enabledBorderColor ?? Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: focusedBorderColor ?? AppColors.kPrimaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: errorBorderColor ?? AppColors.kPrimaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: focusedBorderColor ?? AppColors.kPrimaryColor,
            ),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
