import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../03_controller/00_navigation/routes.dart';
import '../../../../../../03_controller/01_helper/validation.dart';
import '../../../../../../03_controller/03_cubit/screens/two_step_verification/two_step_verification_cubit.dart';
import '../../../../../../03_controller/03_cubit/widgets/account/textfield/text_field_cubit.dart';
import '../../../../../../03_controller/03_cubit/widgets/account/textfield/text_field_states.dart';
import '../../../../../03_widgets/custom_elevated_button.dart';
import '../../../../../03_widgets/custom_text.dart';
import '../../../../../03_widgets/custom_text_field.dart';
import '../../../../../04_utilities/res/strings.dart';


class TwoStepAddPhoneNumberScreen extends StatefulWidget {
  const TwoStepAddPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<TwoStepAddPhoneNumberScreen> createState() => _TwoStepAddPhoneNumberScreenState();
}

class _TwoStepAddPhoneNumberScreenState extends State<TwoStepAddPhoneNumberScreen> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextFieldCubit textFieldCubit = TextFieldCubit.get(context);
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomText(
                    text: AppStrings.twoStepVerificationAddPhoneNo,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                    color: AppColors.kPrimaryBlack,
                  ),
                  SizedBox(height: 2.w),
                  const CustomText(
                    text: AppStrings.twoStepVerificationSendVCodeMsg,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: 3.w),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.lightGrey,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                    ),
                    initialCountryCode: 'US',
                    controller: phoneController,
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding:
                    EdgeInsets.symmetric(horizontal: 3.w),
                    validator: (p0) =>
                        phoneNumberValidation(p0.toString()),
                  ),
                  SizedBox(height: 3.w),
                  const CustomText(
                    text: AppStrings.twoStepVerificationEnterPassword,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                    color: AppColors.kPrimaryBlack,
                  ),
                  SizedBox(height: 2.w),
                  BlocConsumer<TextFieldCubit, TextFieldStates>(
                    listener: (context, state) {},
                    builder: (context, state) => CustomTextField(
                      enabledBorderColor: AppColors.lightGrey,
                      focusedBorderColor: AppColors.kPrimaryColor,
                      errorBorderColor: AppColors.red,
                      prefixIcon: Icons.lock_outline,
                      hintText: AppStrings.password,
                      hintColor: AppColors.lightGrey,
                      prefixIconColor: AppColors.lightGrey,
                      suffixIcon: textFieldCubit.tsvPassSuffixIcon,
                      suffixIconColor: AppColors.lightGrey,
                      borderRadius: 3.w,
                      validator: (value) => passwordValidation(value),
                      controller: passController,
                      obscureText: textFieldCubit.tsvObscure,
                      suffixOnPressed: () {
                        textFieldCubit.twoStepVisibilityChange();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    twoStepVerificationCubit.counter=1;
                    twoStepVerificationCubit.counterFunction();
                    Navigator.pushReplacementNamed(context, AppRoutes.profileLoginNSecurity2StepVerification6DigitRoute);
                  }
                },
                label: AppStrings.twoStepVerificationSendCode,
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
    );
  }
}
