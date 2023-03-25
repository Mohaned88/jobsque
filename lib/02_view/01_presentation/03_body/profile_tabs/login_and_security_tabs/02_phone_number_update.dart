import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../03_controller/01_helper/validation.dart';
import '../../../../03_widgets/custom_elevated_button.dart';
import '../../../../03_widgets/custom_text.dart';
import '../../../../04_utilities/res/strings.dart';

class PhoneNoUpdateScreen extends StatefulWidget {
  const PhoneNoUpdateScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNoUpdateScreen> createState() => _PhoneNoUpdateScreenState();
}

class _PhoneNoUpdateScreenState extends State<PhoneNoUpdateScreen> {

  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    phoneController.text = authCubit.userModel.mobile ?? '1223487950';
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
          text: AppStrings.loginNSecurityPhoneNumber,
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
                    text: AppStrings.phoneNumberMainPhoneNumber,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.kPrimaryBlack,
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
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
                  SizedBox(
                    height: 3.w,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: CustomText(
                           text: AppStrings.phoneNumberResetMsg,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.grey,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      FlutterSwitch(
                        value: false,
                        onToggle: (bool value){},
                        width: 12.w,
                        height: 7.w,
                        toggleSize: 6.w,
                        padding: (0.7).w,
                        activeColor: AppColors.kPrimaryColor,
                        inactiveColor: AppColors.lightGrey,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    authCubit.userModel.mobile = phoneController.text;
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
