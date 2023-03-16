
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/02_account/03_type_selection.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/01_helper/validation.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_states.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_states.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/textfield/text_field_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/textfield/text_field_states.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/01_helper/snack_bar.dart';
import '../../../03_controller/03_cubit/widgets/account/button/account_button_cubit.dart';
import '../../../03_controller/03_cubit/widgets/account/button/account_button_states.dart';
import '../../02_components/acc_screen_component.dart';
import '../../03_widgets/custom_text.dart';
import '../../03_widgets/custom_text_field.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/constants.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AccButtonCubit accButtonCubit = AccButtonCubit.get(context);
    TextFieldCubit textFieldCubit = TextFieldCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    SharedPCubit sharedPCubit = SharedPCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
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
            height: 163.w,
            child: Form(
              key: formKey,
              child: BlocConsumer<AccButtonCubit, AccButtonStates>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, Object? state) {
                  return Column(
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
                            text: AppStrings.loginTitle,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryBlack,
                            height: 1.4,
                          ), // login title
                          SizedBox(
                            height: 2.w,
                          ),
                          const CustomText(
                            text: AppStrings.loginSubTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ), // login subtitle
                          SizedBox(
                            height: 8.w,
                          ),
                          CustomTextField(
                            enabledBorderColor: AppColors.lightGrey,
                            focusedBorderColor: AppColors.kPrimaryColor,
                            errorBorderColor: AppColors.red,
                            prefixIcon: Icons.person_outline_rounded,
                            hintText: AppStrings.email,
                            hintColor: AppColors.lightGrey,
                            prefixIconColor: AppColors.lightGrey,
                            borderRadius: 3.w,
                            validator: (value) => nameValidation(value),
                            controller: nameController,
                          ), // email
                          SizedBox(
                            height: 3.w,
                          ),
                          BlocConsumer<TextFieldCubit, TextFieldStates>(
                            listener: (context, state) {},
                            builder: (context, state) => CustomTextField(
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
                              validator: (value) => passwordValidation(value),
                              controller: passController,
                              obscureText: textFieldCubit.obscure,
                              suffixOnPressed: () {
                                textFieldCubit.visibilityChange();
                              },
                              onChanged: (text) {
                                textFieldCubit.borderColorChange(text);
                              },
                            ),
                          ), // password
                          SizedBox(
                            height: 3.w,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                                height: 5.w,
                                child: BlocConsumer<SharedPCubit,SharedPStates>(
                                  listener: (context,state){},
                                  builder: (context,state)=> Checkbox(
                                    value: sharedPCubit.isLoggedIn,
                                    onChanged: (value) {
                                      sharedPCubit.storeInSharedPrefs(value);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.w),
                                    ),
                                    activeColor: AppColors.kPrimaryColor,
                                    side: BorderSide(
                                      color: AppColors.lightGrey,
                                      width: (1 / 3).w,
                                    ),
                                  ),
                                ),

                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const CustomText(
                                text: AppStrings.rememberMe,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textsBlack,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.resetPasswordRoute);
                                  },
                                  splashColor: Colors.transparent,
                                  radius: 0,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(
                                      text: AppStrings.forgotPass,
                                      color: AppColors.kPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), // remember me & forgot password
                        ],
                      ),
                      BlocConsumer<AuthCubit,AuthStates>(
                        listener: (context,state){
                          if(state is LoginSuccessfullyState){
                            Navigator.pushNamed(context, AppRoutes.workTypeRoute);
                            ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);

                          }
                          if(state is LoginFailedState){
                            ScaffoldMessenger.of(context).showSnackBar(snackBarError);
                          }
                        },
                        builder: (context,state)=>AccScreenComp(
                          directoryTitle: AppStrings.register,
                          compLabel: AppStrings.registerForwardMessage,
                          buttonLabel: AppStrings.loginTitle,
                          replacementAuthLAbel: AppStrings.orLoginWithAccount,
                          directoryOnTap: () {
                            Navigator.pushNamed(context, AppRoutes.signUpRoute);
                          },
                          buttonOnPressed: accButtonCubit.loginOnPressed(
                              email: nameController.text,
                              pass: passController.text,
                              formKey: formKey,
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  authCubit.login(password: passController.text, mail: nameController.text);
                                  //Navigator.pushNamed(context, AppRoutes.workTypeRoute);
                                }
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
                              }),
                          googleAuthOnPressed: () async{},
                          facebookAuthOnPressed: () async{},
                        ),
                      ),
                       // account component
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
