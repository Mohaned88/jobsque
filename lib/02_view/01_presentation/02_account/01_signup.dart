import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/acc_screen_component.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/01_helper/validation.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_states.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/button/account_button_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/button/account_button_states.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '../../../03_controller/01_helper/snack_bar.dart';
import '../../../03_controller/03_cubit/widgets/account/textfield/text_field_cubit.dart';
import '../../../03_controller/03_cubit/widgets/account/textfield/text_field_states.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AccButtonCubit accButtonCubit = AccButtonCubit.get(context);
    TextFieldCubit textFieldCubit = TextFieldCubit.get(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 164.w,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 3.w,
                      ),
                      const CustomText(
                        text: AppStrings.registerTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryBlack,
                        height: 1.4,
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      const CustomText(
                        text: AppStrings.registerSubTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      CustomTextField(
                        enabledBorderColor: AppColors.lightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        prefixIcon: Icons.person_outline_rounded,
                        hintText: AppStrings.username,
                        hintColor: AppColors.lightGrey,
                        prefixIconColor: AppColors.lightGrey,
                        borderRadius: 3.w,
                        validator: (value) => nameValidation(value),
                        controller: nameController,
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
                      SizedBox(
                        height: 3.w,
                      ),
                      BlocConsumer<TextFieldCubit,TextFieldStates>(
                        listener: (context, state) {},
                        builder: (context, state) =>
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  enabledBorderColor: AppColors.lightGrey,
                                  focusedBorderColor: textFieldCubit.borderColor,
                                  errorBorderColor: AppColors.red,
                                  prefixIcon: Icons.lock_outline,
                                  hintText: AppStrings.password,
                                  hintColor: AppColors.lightGrey,
                                  prefixIconColor: AppColors.lightGrey,
                                  suffixIcon: textFieldCubit.passSuffixIcon,
                                  suffixIconColor: AppColors.lightGrey,
                                  borderRadius: 3.w,
                                  validator: (value) =>
                                      passwordValidation(value),
                                  controller: passController,
                                  obscureText: textFieldCubit.obscure,
                                  suffixOnPressed: (){
                                    textFieldCubit.visibilityChange();
                                  },
                                  onChanged: (text){
                                    textFieldCubit.borderColorChange(text);
                                  },
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                CustomText(
                                  text: AppStrings.passwordRequirementsM,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: textFieldCubit.passCheckTextColor,
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                  BlocConsumer<AuthCubit,AuthStates>(
                    listener: (context,state){
                      if(state is RegisterSuccessfullyState){
                        Navigator.pushNamed(context, AppRoutes.workTypeRoute);
                        ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
                      }
                      if(state is RegisterFailedState){
                        ScaffoldMessenger.of(context).showSnackBar(snackBarError);
                      }
                    },
                    builder: (context,state)=> BlocConsumer<AccButtonCubit,AccButtonStates>(
                      listener: (BuildContext context, state) {},
                      builder: (BuildContext context, Object? state) {
                        return AccScreenComp(
                          directoryOnTap: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.logInRoute);
                          },
                          buttonOnPressed: accButtonCubit.signupOnPressed(
                            name: nameController.text,
                            email: emailController.text,
                            pass: passController.text,
                            formKey: formKey,
                            context: context,
                          ),
                          googleAuthOnPressed: () {},
                          facebookAuthOnPressed: () {},
                        );
                      },
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

  onPressed() {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passController.text.isEmpty) {
      return null;
    } else {
      return () {
        if (formKey.currentState!.validate()) {
          /*await cubit.registerByEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                      );
                      sharedPCubit.storeInSharedPrefs(logState: true);
                      sharedPCubit.setUserDataInPrefs(
                        email:emailController.text,
                        name:cubit.registerUser.name,
                        photo: cubit.registerUser.photo,
                        id: cubit.registerUser.id,
                      );*/
        }
      };
    }
  }
}
