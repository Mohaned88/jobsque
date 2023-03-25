import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../03_controller/01_helper/validation.dart';
import '../../../../../03_controller/03_cubit/widgets/account/textfield/text_field_cubit.dart';
import '../../../../../03_controller/03_cubit/widgets/account/textfield/text_field_states.dart';
import '../../../../03_widgets/custom_elevated_button.dart';
import '../../../../03_widgets/custom_text.dart';
import '../../../../03_widgets/custom_text_field.dart';
import '../../../../04_utilities/res/strings.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    SharedPCubit sharedPCubit = SharedPCubit.get(context);
    TextFieldCubit textFieldCubit = TextFieldCubit.get(context);
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
          text: AppStrings.loginNSecurityChangePassword,
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
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CustomText(
                              text: AppStrings.changePasswordOldPassword,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(height: 3.w),
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
                                suffixIcon: textFieldCubit.cpSuffixIcons[0],
                                suffixIconColor: AppColors.lightGrey,
                                borderRadius: 3.w,
                                validator: (value) => oldPasswordValidation(value,context),
                                controller: currentPassController,
                                obscureText: textFieldCubit.cpFieldsObscure[0],
                                suffixOnPressed: () {
                                  textFieldCubit
                                      .changePasswordVisibilityChange(0);
                                },
                              ),
                            ),
                            SizedBox(height: 3.w),
                            const CustomText(
                              text: AppStrings.changePasswordNewPassword,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(height: 3.w),
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
                                suffixIcon: textFieldCubit.cpSuffixIcons[1],
                                suffixIconColor: AppColors.lightGrey,
                                borderRadius: 3.w,
                                validator: (value) => passwordValidation(value),
                                controller: newPassController,
                                obscureText: textFieldCubit.cpFieldsObscure[1],
                                suffixOnPressed: () {
                                  textFieldCubit
                                      .changePasswordVisibilityChange(1);
                                },
                              ),
                            ),
                            SizedBox(height: 3.w),
                            const CustomText(
                              text: AppStrings.changePasswordConfirmPassword,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(height: 3.w),
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
                                suffixIcon: textFieldCubit.cpSuffixIcons[2],
                                suffixIconColor: AppColors.lightGrey,
                                borderRadius: 3.w,
                                validator: (value) => confirmPassValidation(value, newPassController.text),
                                controller: confirmPassController,
                                obscureText: textFieldCubit.cpFieldsObscure[2],
                                suffixOnPressed: () {
                                  textFieldCubit
                                      .changePasswordVisibilityChange(2);
                                },
                              ),
                            ),
                            SizedBox(height: 3.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ///////////////////////////////////////////////////////////////////
                  }
                },
                label: AppStrings.editProfileSave,
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
