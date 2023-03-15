import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../03_widgets/custom_elevated_button_ver2.dart';
import '../03_widgets/custom_text.dart';
import '../04_utilities/res/assets.dart';
import '../04_utilities/res/strings.dart';
import '../05_styles/colors.dart';

class UploadBox extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;

  const UploadBox({
    Key? key,
    required this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(2.w),
      padding: EdgeInsets.all(1.w),
      color: AppColors.kPrimaryColor,
      dashPattern: [3.w, 1.w],
      strokeWidth: 1.25,
      borderPadding: const EdgeInsets.all(1),
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: AppColors.kBlue100,
          borderRadius: BorderRadius.circular(2.w),
        ),
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              padding: EdgeInsets.all(3.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kBlue200,
              ),
              child: Image.asset(AppAssets.documentUploadSign),
            ),
            SizedBox(
              height: 3.w,
            ),
            CustomText(
              text: title!,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.3,
              color: AppColors.kPrimaryBlack,
            ),
            const CustomText(
              text: AppStrings.uploadDocsUBoxSubTitle,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.5,
              color: AppColors.grey,
            ),
            SizedBox(
              height: 3.w,
            ),
            CustomElevatedButtonVer2(
              onPressed: onPressed,
              label: AppStrings.uploadDocsAddFileButtonLabel,
              icon: Icons.file_upload_outlined,
              backgroundColor: AppColors.kBlue200,
              iconColor: AppColors.kPrimaryColor,
              labelColor: AppColors.kPrimaryColor,
              borderRadius: 10.w,
              width: 80.w,
              height: 12.w,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
