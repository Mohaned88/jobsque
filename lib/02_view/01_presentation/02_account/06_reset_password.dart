import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field.dart';
import 'package:jobsque/02_view/03_widgets/text_inkwell.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/01_helper/validation.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '../../03_widgets/custom_elevated_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            AppAssets.logoPath,
            width: 21.w,
            height: 6.w,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 164.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7.w),
                      const CustomText(
                        text: AppStrings.resetPasswordTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: AppColors.textsBlack,
                      ),
                      SizedBox(height: 3.w),
                      const CustomText(
                        text: AppStrings.resetPasswordSubTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: AppColors.textsGrey,
                      ),
                      SizedBox(height: 9.w),
                      CustomTextField(
                        width: double.infinity,
                        borderRadius: 3.w,
                        enabledBorderColor: AppColors.midLightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        hintText: AppStrings.enterYourEmail,
                        hintColor: AppColors.midLightGrey,
                        prefixIconColor: AppColors.midLightGrey,
                        prefixIcon: Icons.email_outlined,
                        controller: emailController,
                        validator: (value) => emailValidation(value),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInkwell(
                        labelText: AppStrings.rpForwardingMessage,
                        labelFontSize: 14,
                        labelFontWeight: FontWeight.w500,
                        labelColor: AppColors.textsGrey,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.logInRoute);
                        },
                        directoryText: AppStrings.loginTitle,
                        directoryFontSize: 14,
                        directoryFontWeight: FontWeight.w500,
                        directoryColor: AppColors.kPrimaryColor,
                        alignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 3.w),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.w),
                        child: CustomElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              Navigator.pushNamed(context, AppRoutes.checkEmailRoute);
                            }
                          },
                          label: AppStrings.requestPasswordReset,
                          width: double.infinity,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
