import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class SetUpSuccessScreen extends StatelessWidget {
  const SetUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Image.asset(
                      AppAssets.setUpScreenImagePath,
                      width: 50.w,
                      height: 50.w,
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    const CustomText(
                      text: AppStrings.setUpSuccessTitle,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      color: AppColors.textsBlack,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    const CustomText(
                      text: AppStrings.setUpSuccessSubTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: AppColors.grey,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.w),
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.bodyMainPageRoute);
                },
                label: AppStrings.onBoardingGetStarted,
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
    );
  }
}
