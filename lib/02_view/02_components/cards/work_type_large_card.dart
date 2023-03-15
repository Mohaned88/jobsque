import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../05_styles/colors.dart';

class WorkTypeLargeCard extends StatelessWidget {
  String jobTitle;
  String requiredDocs;
  Color? borderColor = AppColors.lightGrey;
  IconData? radioButton = Icons.radio_button_off_outlined;
  Color? fillColor = Colors.transparent;
  GestureTapCallback? onTap;

  WorkTypeLargeCard({
    required this.jobTitle,
    required this.requiredDocs,
    this.borderColor,
    this.fillColor,
    this.radioButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 20.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
            color: fillColor, //Colors.blue.withOpacity(0.2),
            border: Border.all(
              color: borderColor!,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: jobTitle,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                    color: AppColors.kPrimaryBlack,
                  ),
                  CustomText(
                    text: requiredDocs,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.textsGrey,
                  ),
                ],
              ),
            ),
            Icon(
              radioButton,
              color: borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
