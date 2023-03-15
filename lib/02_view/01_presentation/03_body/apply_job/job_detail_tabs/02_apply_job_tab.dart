import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../03_widgets/custom_text.dart';
import '../../../../04_utilities/res/strings.dart';
import '../../../../05_styles/colors.dart';

class ApplyJobTab2 extends StatelessWidget {
  final String email;
  final String website;
  final String aboutCompany;

  const ApplyJobTab2({
    Key? key,
    required this.email,
    required this.website,
    required this.aboutCompany,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomText(
          text: AppStrings.applyJobCompanyContactUs,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
        ),
        SizedBox(
          height: 2.w,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 16.w,
              width: 45.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomText(
                    text: AppStrings.email,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.5,
                    color: AppColors.midLightGrey,
                  ),
                  CustomText(
                    text: email,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.kPrimaryBlack,
                  ),
                ],
              ),
            ),
            Container(
              height: 16.w,
              width: 45.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomText(
                    text: AppStrings.applyJobCompanyWebSiteTitle,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.5,
                    color: AppColors.midLightGrey,
                  ),
                  CustomText(
                    text: website,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.kPrimaryBlack,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.w,
        ),
        const CustomText(
          text: AppStrings.applyJobCompanyAboutCompanyTitle,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
        ),
        SizedBox(
          height: 2.w,
        ),
        CustomText(
          text: aboutCompany,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.5,
          color: AppColors.textGrey2,
        ),
      ],
    );
  }
}
