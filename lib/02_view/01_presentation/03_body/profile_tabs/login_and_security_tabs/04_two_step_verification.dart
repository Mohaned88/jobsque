import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/03_cubit/screens/two_step_verification/two_step_verification_states.dart';
import 'package:sizer/sizer.dart';

import '../../../../../03_controller/03_cubit/screens/two_step_verification/two_step_verification_cubit.dart';
import '../../../../03_widgets/custom_elevated_button.dart';
import '../../../../03_widgets/custom_text.dart';
import '../../../../04_utilities/res/strings.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  const TwoStepVerificationScreen({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen> createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {

  @override
  Widget build(BuildContext context) {
    TwoStepVerificationCubit twoStepVerificationCubit = TwoStepVerificationCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.kPrimaryBlack,
          ),
        ),
        title: const CustomText(
          text: AppStrings.loginNSecurity2StepVerification,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: BlocConsumer<TwoStepVerificationCubit, TwoStepVerificationStates>(
          listener: (context, state) {},
          builder: (context, state) => Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(color: AppColors.lightGrey),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: CustomText(
                            text: AppStrings.twoStepVerificationSecureMsg,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.grey,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        FlutterSwitch(
                          value: twoStepVerificationCubit.isActive,
                          onToggle: (bool value) {
                            twoStepVerificationCubit
                                .activateOrDeActivate2StepVerification(
                                    value: value);
                          },
                          width: 12.w,
                          height: 7.w,
                          toggleSize: 6.w,
                          padding: (0.7).w,
                          activeColor: AppColors.kPrimaryColor,
                          inactiveColor: AppColors.lightGrey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.w),
                  if (twoStepVerificationCubit.isActive == false) ...[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kBlue200,
                          ),
                          child: Image.asset(
                            AppAssets.profileLoginNSecurityImage,
                            width: 6.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        const Expanded(
                          child: CustomText(
                            text: AppStrings.twoStepVerificationGSTR1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.w),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kBlue200,
                          ),
                          child: Image.asset(
                            AppAssets.externalDiskIcon,
                            width: 6.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        const Expanded(
                          child: CustomText(
                            text: AppStrings.twoStepVerificationGSTR2,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (twoStepVerificationCubit.isActive == true) ...[
                    const CustomText(
                      text: AppStrings.twoStepVerificationSelectMethodQ,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.kPrimaryBlack,
                    ),
                    SizedBox(height: 3.w),
                    Container(
                      height: 15.w,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: twoStepVerificationCubit.method,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.4,
                              color: AppColors.kPrimaryBlack,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          PopupMenuButton(
                            itemBuilder: (BuildContext context){
                              return [
                                PopupMenuItem(
                                  onTap: () {
                                    twoStepVerificationCubit.selectVerificationMethod(methodName: AppStrings.twoStepVerificationMethods[0]);
                                  },
                                  value: AppStrings.twoStepVerificationMethods[0],
                                  child: CustomText(
                                    text: AppStrings.twoStepVerificationMethods[0],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: AppColors.kPrimaryBlack,
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    twoStepVerificationCubit.selectVerificationMethod(methodName: AppStrings.twoStepVerificationMethods[1]);

                                  },
                                  value: AppStrings.twoStepVerificationMethods[1],
                                  child: CustomText(
                                    text: AppStrings.twoStepVerificationMethods[1],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: AppColors.kPrimaryBlack,
                                  ),
                                ),
                              ];
                            } ,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.w),
                    const CustomText(
                      text: AppStrings.twoStepVerificationSelectMethodN,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.grey,
                    ),
                  ],
                ],
              ),
              Positioned(
                bottom: 0,
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.profileLoginNSecurity2StepVerificationPhoneNoRoute);
                  },
                  label: AppStrings.onBoardingNext,
                  width: 90.w,
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
    );
  }
}
