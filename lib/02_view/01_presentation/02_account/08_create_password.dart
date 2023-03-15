import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '../../../03_controller/01_helper/validation.dart';
import '../../03_widgets/custom_elevated_button.dart';
import '../../03_widgets/custom_text.dart';
import '../../03_widgets/custom_text_field.dart';
import '../../03_widgets/text_inkwell.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

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
                        text: AppStrings.createNewPassTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: AppColors.textsBlack,
                      ),
                      SizedBox(height: 3.w),
                      const CustomText(
                        text: AppStrings.createNewPassSubTitle,
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
                        hintText: AppStrings.enterNewPassword,
                        hintColor: AppColors.midLightGrey,
                        prefixIconColor: AppColors.midLightGrey,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: Icons.visibility_off_outlined,
                        suffixIconColor: AppColors.midLightGrey,
                        controller: newPassController,
                        validator: (value) => passwordValidation(value),
                      ),
                      SizedBox(height: 3.w),
                      const CustomText(
                        text: AppStrings.passwordRequirementsM,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: AppColors.midLightGrey,
                      ),
                      SizedBox(height: 9.w),
                      CustomTextField(
                        width: double.infinity,
                        borderRadius: 3.w,
                        enabledBorderColor: AppColors.midLightGrey,
                        hintText: AppStrings.confirmPassword,
                        hintColor: AppColors.midLightGrey,
                        prefixIconColor: AppColors.midLightGrey,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: Icons.visibility_off_outlined,
                        suffixIconColor: AppColors.midLightGrey,
                        controller: confirmPassController,
                        validator: (value) => confirmPassValidation(value,newPassController.text),
                      ),
                      SizedBox(height: 3.w),
                      const CustomText(
                        text: AppStrings.createNewPassConfirm,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: AppColors.midLightGrey,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.w),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, AppRoutes.passSuccessRoute);
                        }
                      },
                      label: AppStrings.createNewPassButtonLabel,
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
            ),
          ),
        ),
      ),
    );
  }
}
