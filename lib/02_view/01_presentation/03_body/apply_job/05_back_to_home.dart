import 'package:flutter/material.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../03_widgets/custom_elevated_button.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/assets.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';


class BackToHomeScreen extends StatelessWidget {
  const BackToHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.bioDataApplyJob,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 163.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.dataSentSuccessfully,
                        width: 50.w,
                        height: 50.w,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      const CustomText(
                        text: AppStrings.dataSentSuccessTitle,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: AppColors.textsBlack,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      const CustomText(
                        text: AppStrings.dataSentSuccessSubTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        color: AppColors.grey,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.w),
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.bodyMainPageRoute);
                    },
                    label: AppStrings.dataSentSuccessButtonLabel,
                    width: 88.w,
                    alignment: Alignment.center,
                    height: 13.w,
                    borderRadius: 10.w,
                    backgroundColor: AppColors.kPrimaryColor,
                    labelFontSize: 16,
                    labelFontWeight: FontWeight.w500,
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
