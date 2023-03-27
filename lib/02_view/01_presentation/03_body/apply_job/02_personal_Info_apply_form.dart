
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/02_view/03_widgets/application_steps.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field.dart';
import 'package:jobsque/03_controller/01_helper/validation.dart';
import 'package:sizer/sizer.dart';
import '../../../../03_controller/00_navigation/routes.dart';
import '../../../03_widgets/custom_elevated_button.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({Key? key}) : super(key: key);

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.bioDataApplyJob,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 163.w,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ApplicationSteps(
                            isActiveStep1: true,
                          ),
                          SizedBox(height: 6.w,),
                          CustomText(
                            text: AppStrings.bioDataStepTitle[0],
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 1.2,
                            color: AppColors.kPrimaryBlack,
                          ),
                          SizedBox(height: 2.w,),
                          const CustomText(
                            text: AppStrings.bioDataSubTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.grey,
                          ),
                          SizedBox(height: 6.w,),
                          Row(
                            children: const [
                              CustomText(
                                text: AppStrings.bioDataFullName,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.kPrimaryBlack,
                              ),
                              CustomText(
                                text: '*',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.red,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.w,),
                          CustomTextField(
                            borderRadius: 3.w,
                            enabledBorderColor: AppColors.lightGrey,
                            focusedBorderColor: AppColors.kPrimaryColor,
                            prefixIcon: Icons.person_outline_rounded,
                            prefixIconColor: AppColors.lightGrey,
                            validator: (value) => nameValidation(value),
                            controller: nameController,
                          ),
                          SizedBox(height: 5.w,),
                          Row(
                            children: const [
                              CustomText(
                                text: AppStrings.email,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.kPrimaryBlack,
                              ),
                              CustomText(
                                text: '*',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.red,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.w,),
                          CustomTextField(
                            borderRadius: 3.w,
                            enabledBorderColor: AppColors.lightGrey,
                            focusedBorderColor: AppColors.kPrimaryColor,
                            prefixIcon: Icons.email_outlined,
                            prefixIconColor: AppColors.lightGrey,
                            validator: (value) => emailValidation(value),
                            controller: emailController,
                          ),
                          SizedBox(height: 5.w,),
                          Row(
                            children: const [
                              CustomText(
                                text: AppStrings.bioDataPhoneNumber,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.kPrimaryBlack,
                              ),
                              CustomText(
                                text: '*',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.red,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.w,),
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
                            flagsButtonPadding: EdgeInsets.symmetric(horizontal: 3.w),
                            validator: (p0) => phoneNumberValidation(p0.toString()),
                          ),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.applyJobTypeOfWorkPageRoute);
                      },
                      label: AppStrings.onBoardingNext,
                      width: 88.w,
                      alignment: Alignment.center,
                      height: 13.w,
                      borderRadius: 10.w,
                      backgroundColor: AppColors.kPrimaryColor,
                      labelFontSize: 16,
                      labelFontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
