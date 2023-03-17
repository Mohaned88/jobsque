import 'package:flutter/cupertino.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../04_utilities/res/strings.dart';

class ApplyJobTab1 extends StatelessWidget {

  final String jobDescription;
  final String requiredSills;

  const ApplyJobTab1({
    Key? key,
    required this.jobDescription,
    required this.requiredSills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomText(
          text: AppStrings.applyJobDescriptionTitle,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
        ),
        SizedBox(
          height: 2.w,
        ),
        CustomText(
          text: jobDescription,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.5,
          color: AppColors.textGrey2,
        ),
        SizedBox(
          height: 3.w,
        ),
        const CustomText(
          text: AppStrings.applyJobRequiredSkillsTitle,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
        ),
        SizedBox(
          height: 2.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child:  CustomText(
                text: requiredSills,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.5,
                color: AppColors.textGrey2,
              ),
          ),
      ],
    );
  }
}
