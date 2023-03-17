import 'package:flutter/material.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/01_apply_job_main.dart';
import 'package:sizer/sizer.dart';

import '../../../01_model/05_job_model/job_model.dart';
import '../../03_widgets/custom_text.dart';
import 'job_type_card.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class JobPreviewCard extends StatelessWidget {
  final JobModel? jobModel;
  final VoidCallback? saveOnPressed;
  final String? suffixIcon;

  const JobPreviewCard({
    Key? key,
    this.jobModel,
    this.saveOnPressed,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ApplyJobScreen(
              jobModel: jobModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.w),
        padding: EdgeInsets.all(2.w),
        height: 30.w,
        width: double.infinity,
        child: Card(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        jobModel!.types!.length,
                        (index) => JobTypeCard(
                          label: jobModel!.types![index],
                          fillColor: AppColors.kBlue200,
                          labelColor: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          horizontalPadding: 4.w,
                          verticalPadding: 1.w,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: '\$${jobModel!.salary!.split('-')[1].toString()}',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        color: AppColors.green2,
                      ),
                      const CustomText(
                        text: '/Months',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: AppColors.textsGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
