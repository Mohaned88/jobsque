import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class ApplicationSteps extends StatelessWidget {
  bool isDoneStep1;
  bool isDoneStep2;
  bool isDoneStep3;

  bool isActiveStep1;
  bool isActiveStep2;
  bool isActiveStep3;
  int? stepNumber;

  ApplicationSteps({
    Key? key,
    this.isDoneStep1 = false,
    this.isDoneStep2 = false,
    this.isDoneStep3 = false,
    this.isActiveStep1 = false,
    this.isActiveStep2 = false,
    this.isActiveStep3 = false,
    this.stepNumber = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(stepNumber == 1){
      isActiveStep1 = true;
    }
    else if(stepNumber == 2){
      isActiveStep1 = true;
      isActiveStep2 = true;
      isDoneStep1 = true;
    }
    else if(stepNumber == 3){
      isActiveStep1 = true;
      isActiveStep2 = true;
      isActiveStep3 = true;
      isDoneStep1 = true;
      isDoneStep2 = true;
    }
    else{
      isActiveStep1 = true;
      isActiveStep2 = true;
      isActiveStep3 = true;
      isDoneStep1 = true;
      isDoneStep2 = true;
      isDoneStep3 = true;
    }
    return SizedBox(
      width: double.infinity,
      height: 18.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 25.w,
            height: 18.w,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isDoneStep1
                    ? Container(
                        width: 12.w,
                        height: 12.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppAssets.doneSign),
                          ),
                        ),
                      )
                    : Container(
                        width: 12.w,
                        height: 12.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isActiveStep1
                                ? AppColors.kPrimaryColor
                                : AppColors.midLightGrey,
                          ),
                        ),
                        child: CustomText(
                          text: '1',
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.3,
                          color: isActiveStep1
                              ? AppColors.kPrimaryColor
                              : AppColors.midLightGrey,
                        ),
                      ),
                CustomText(
                  text: AppStrings.bioDataStepTitle[0],
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.5,
                  color: isActiveStep1
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryBlack,
                ),
              ],
            ),
          ),
          Expanded(
            child: DottedLine(
              dashColor: isActiveStep2
                  ? AppColors.kPrimaryColor
                  : AppColors.midLightGrey,
              lineThickness: (1 / 6).w,
            ),
          ),
          SizedBox(
            width: 25.w,
            height: 18.w,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isDoneStep2
                    ? Container(
                  width: 12.w,
                  height: 12.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.doneSign),
                    ),
                  ),
                )
                    :Container(
                  width: 12.w,
                  height: 12.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActiveStep2
                          ? AppColors.kPrimaryColor
                          : AppColors.midLightGrey,
                    ),
                  ),
                  child: CustomText(
                    text: '2',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                    color: isActiveStep2
                        ? AppColors.kPrimaryColor
                        : AppColors.midLightGrey,
                  ),
                ),
                CustomText(
                  text: AppStrings.bioDataStepTitle[1],
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.5,
                  color: isActiveStep2
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryBlack,
                ),
              ],
            ),
          ),
          Expanded(
            child: DottedLine(
              dashColor: isActiveStep3
                  ? AppColors.kPrimaryColor
                  : AppColors.midLightGrey,
              lineThickness: (1 / 6).w,
            ),
          ),
          SizedBox(
            width: 25.w,
            height: 18.w,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isDoneStep3
                    ? Container(
                  width: 12.w,
                  height: 12.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.doneSign),
                    ),
                  ),
                )
                    :Container(
                  width: 12.w,
                  height: 12.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActiveStep3
                          ? AppColors.kPrimaryColor
                          : AppColors.midLightGrey,
                    ),
                  ),
                  child: CustomText(
                    text: '3',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                    color: isActiveStep3
                        ? AppColors.kPrimaryColor
                        : AppColors.midLightGrey,
                  ),
                ),
                CustomText(
                  text: AppStrings.bioDataStepTitle[2],
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.5,
                  color: isActiveStep3
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
