import 'package:flutter/material.dart';
import 'package:jobsque/02_view/01_presentation/03_body/applied_job_tabs/applied_job_steps.dart';
import 'package:jobsque/02_view/03_widgets/application_steps.dart';
import 'package:sizer/sizer.dart';

import '../../../01_model/05_job_model/job_model.dart';
import '../../03_widgets/custom_text.dart';
import 'job_type_card.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';
import 'package:intl/intl.dart';


class AppliedJobPreviewCard extends StatelessWidget {
  final JobModel? jobModel;
  final VoidCallback? saveOnPressed;
  final String? suffixIcon;
  final GestureTapCallback? gestureOnTap;
  final int? stepNumber;

  const AppliedJobPreviewCard({
    Key? key,
    this.jobModel,
    this.saveOnPressed,
    this.suffixIcon,
    this.gestureOnTap,
    this.stepNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureOnTap ?? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppliedJobScreen(
              jobModel: jobModel,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.w,horizontal: 3.w),
        height: 55.w,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Image.asset(
                        jobModel!.image ?? AppAssets.twitterLogo,
                        width: 10.w,
                        height: 10.w,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: jobModel!.name ?? AppStrings.applyJobTitle,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            height: 1.3,
                            color: AppColors.kPrimaryBlack,
                          ),
                          CustomText(
                            text:
                            '${jobModel!.company ?? AppStrings.applyJobLocationCompany} • ${jobModel!.location ?? AppStrings.applyJobLocationCity}',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.5,
                            color: AppColors.midLightGrey,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: saveOnPressed,
                      padding: const EdgeInsets.all(0),
                      icon: Image.asset(
                        suffixIcon == null ? AppAssets.bottomBarIcon[3] : suffixIcon!,
                        color: AppColors.iconsBlack,
                        width: 7.w,
                        height: 7.w,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        JobTypeCard(
                          label: jobModel!.types![1],
                          fillColor: AppColors.kBlue200,
                          labelColor: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          horizontalPadding: 4.w,
                          verticalPadding: 1.w,
                        ),
                        SizedBox(width: 2.w,),
                        JobTypeCard(
                          label: jobModel!.types![2],
                          fillColor: AppColors.kBlue200,
                          labelColor: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          horizontalPadding: 4.w,
                          verticalPadding: 1.w,
                        ),
                      ],
                    ),
                    CustomText(
                      text: 'Posted ${DateFormat.Md().format(DateTime.parse("${jobModel!.createdAt}")).compareTo('${DateTime.now()}')} days ago',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.5,
                      color: AppColors.kBlack100,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 22.w,
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                  child: ApplicationSteps(
                    stepNumber: stepNumber,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
