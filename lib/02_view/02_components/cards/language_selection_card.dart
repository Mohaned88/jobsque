import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../03_widgets/custom_text.dart';
import '../../05_styles/colors.dart';

class LanguageSelectionCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String flag;
  final String language;
  final IconData? icon;
  final Color? iconColor;

  const LanguageSelectionCard({
    Key? key,
    this.onTap,
    required this.flag,
    required this.language,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 12.w,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              flag,
              width: 8.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: CustomText(
                text: language,
                color: AppColors.kPrimaryBlack,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.3,
              ),
            ),
            Icon(
              icon,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
