import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class JobTypeCard extends StatelessWidget {
  final String label;
  final Color? fillColor;
  final Color? labelColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final GestureTapCallback? onTap;
  final Color? borderColor;

  const JobTypeCard({
    Key? key,
    required this.label,
    this.fillColor,
    this.labelColor,
    this.fontWeight,
    this.fontSize,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 3.w, vertical: verticalPadding ?? 2.w),
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.kBlue300,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: CustomText(
          textAlign: TextAlign.center,
          text: label,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 12,
          height: height ?? 1.5,
          color: labelColor ?? AppColors.kPrimaryColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      constraints: BoxConstraints(maxWidth: 22.w),
    );
  }
}
