import 'package:flutter/material.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../03_controller/01_helper/validation.dart';
import '../../../../03_widgets/custom_elevated_button.dart';
import '../../../../03_widgets/custom_text.dart';
import '../../../../03_widgets/custom_text_field.dart';
import '../../../../04_utilities/res/strings.dart';

class EmailUpdateScreen extends StatefulWidget {
  const EmailUpdateScreen({Key? key}) : super(key: key);

  @override
  State<EmailUpdateScreen> createState() => _EmailUpdateScreenState();
}

class _EmailUpdateScreenState extends State<EmailUpdateScreen> {

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    emailController.text = authCubit.userModel.email!;
    SharedPCubit sharedPCubit = SharedPCubit.get(context);
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
          text: AppStrings.loginNSecurityEmailAddress,
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
                    text: AppStrings.emailAddressMainEmailAddress,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.kPrimaryBlack,
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  CustomTextField(
                    enabledBorderColor: AppColors.lightGrey,
                    focusedBorderColor: AppColors.kPrimaryColor,
                    errorBorderColor: AppColors.red,
                    prefixIcon: Icons.email_outlined,
                    hintText: AppStrings.email,
                    hintColor: AppColors.lightGrey,
                    prefixIconColor: AppColors.lightGrey,
                    borderRadius: 3.w,
                    validator: (value) => emailValidation(value),
                    controller: emailController,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    authCubit.userModel.email = emailController.text;
                    sharedPCubit.setUserDataInPrefs(userModel: authCubit.userModel);
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
