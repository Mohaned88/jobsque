import 'package:flutter/material.dart';
import 'package:jobsque/01_model/05_job_model/job_model.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/02_components/cards/job_type_card.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:sizer/sizer.dart';

import '../../01_presentation/03_body/apply_job/01_apply_job_main.dart';
import '../../05_styles/colors.dart';

class SuggestedJobCard extends StatelessWidget {
  final Color? fillColor;
  final JobModel? jobModel;
  final VoidCallback? saveOnPressed;

  const SuggestedJobCard({
    Key? key,
    this.fillColor,
    this.jobModel,
    this.saveOnPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.w,
      margin: EdgeInsets.only(right: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            minVerticalPadding: 0,
            leading: Container(
              width: 12.w,
              height: 12.w,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: AppColors.white,
              ),
              child: Image.asset(jobModel!.image ?? AppAssets.excelLogo),
            ),
            title: CustomText(
              text: jobModel!.name ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.3,
              color: fillColor == AppColors.kDarkBlue
                  ? AppColors.white
                  : AppColors.kPrimaryBlack,
            ),
            subtitle: CustomText(
              text: '${jobModel!.company} • ${jobModel!.location}',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.5,
              color: fillColor == AppColors.kDarkBlue
                  ? AppColors.midLightGrey
                  : AppColors.grey,
            ),
            trailing: IconButton(
              onPressed: saveOnPressed,
              padding: const EdgeInsets.all(0),
              icon: Image.asset(
                AppAssets.bottomBarIcon[3],
                color: fillColor == AppColors.kDarkBlue
                    ? AppColors.white
                    : AppColors.kPrimaryBlack,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              jobModel!.types!.length,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.w),
                  child: JobTypeCard(
                    label: jobModel!.types![index],
                    fillColor: fillColor == AppColors.kDarkBlue
                        ? AppColors.white.withOpacity(0.15)
                        : AppColors.kBlue200,
                    labelColor: fillColor == AppColors.kDarkBlue
                        ? AppColors.white
                        : AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 9.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: '\$${jobModel!.salary}',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.2,
                        color: fillColor == AppColors.kDarkBlue
                            ? AppColors.white
                            : AppColors.kPrimaryBlack,
                      ),
                      const CustomText(
                        text: AppStrings.suggestedJobsSalaryPer,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  width: 27.w,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyJobScreen(
                          jobModel: jobModel,
                        ),
                      ),
                    );
                  },
                  borderRadius: 10.w,
                  labelColor: AppColors.white,
                  label: 'Apply Now',
                  labelFontSize: 12,
                  labelFontWeight: FontWeight.w500,
                  backgroundColor: AppColors.kPrimaryColor,
                  alignment: Alignment.center,
                  height: 9.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
