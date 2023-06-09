import 'package:flutter/material.dart';
import 'package:jobsque/02_view/02_components/cards/applied_job_preview_card.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../02_components/cards/job_preview_card.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/assets.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class ActiveJobsTab extends StatelessWidget {
  const ActiveJobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplyJobCubit applyJobCubit = ApplyJobCubit.get(context);
    if (applyJobCubit.appliedActiveJobs.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.appliedJobNoActivesImage,
                    width: 50.w,
                    height: 50.w,
                  ),
                  SizedBox(height: 3.w),
                  const CustomText(
                    text: AppStrings.appliedJobNoActivesTitle,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: AppColors.textsBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2.w),
                  const CustomText(
                    text: AppStrings.appliedJobNoActivesSubTitle,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    else {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AppliedJobPreviewCard(
                jobModel: applyJobCubit.appliedActiveJobs[index],
                saveOnPressed: (){},
                stepNumber: index+2,
              ),
              childCount: applyJobCubit.appliedActiveJobs.length,
            ),
          ),
        ],
      );
    }
  }
}
