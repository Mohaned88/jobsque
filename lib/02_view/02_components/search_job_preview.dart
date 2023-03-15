import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../04_utilities/res/assets.dart';

class SearchJobPreview extends StatelessWidget {
  final String? title;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final VoidCallback? suffixIconOnPressed;
  final GestureTapCallback? onTap;

  const SearchJobPreview({
    Key? key,
    this.title,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconOnPressed,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            Image.asset(
              prefixIcon ?? AppAssets.clockIcon,
              color: prefixIconColor ?? AppColors.iconsBlack,
              width: 5.w,
              height: 5.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: CustomText(
                text: title ?? 'Junior UI Designer',
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.4,
                color: AppColors.kPrimaryBlack,
              ),
            ),
            IconButton(
              onPressed: suffixIconOnPressed,
              padding: const EdgeInsets.all(0),
              icon: Icon(
                suffixIcon ?? Icons.highlight_remove,
                color: suffixIconColor ?? AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
