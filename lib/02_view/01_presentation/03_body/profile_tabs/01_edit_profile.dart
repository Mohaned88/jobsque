import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../03_controller/00_navigation/routes.dart';
import '../../../../03_controller/01_helper/validation.dart';
import '../../../03_widgets/custom_elevated_button.dart';
import '../../../03_widgets/custom_text_field.dart';
import '../../../04_utilities/res/assets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
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
                  text: AppStrings.profileEditProfile,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.kPrimaryBlack,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 32.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 25.w,
                              height: 25.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppAssets.profileStandardImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 25.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            Image.asset(AppAssets.cameraIcon, width: 8.w),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      const CustomText(
                        text: AppStrings.editProfileChangePhoto,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.kPrimaryColor,
                      ),
                    ],
                  ),
                ), // Profile Picture
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CustomText(
                              text: AppStrings.editProfileName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              color: AppColors.midLightGrey,
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            SizedBox(
                              height: 13.w,
                              child: CustomTextField(
                                borderRadius: 3.w,
                                enabledBorderColor: AppColors.lightGrey,
                                focusedBorderColor: AppColors.kPrimaryColor,
                                prefixIcon: Icons.person_outline_rounded,
                                prefixIconColor: AppColors.lightGrey,
                                validator: (value) => nameValidation(value),
                                controller: nameController,
                              ),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: AppStrings.editProfileBio,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              color: AppColors.midLightGrey,
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            SizedBox(
                              height: 13.w,
                              child: CustomTextField(
                                borderRadius: 3.w,
                                enabledBorderColor: AppColors.lightGrey,
                                focusedBorderColor: AppColors.kPrimaryColor,
                                validator: (value) => nameValidation(value),
                                controller: bioController,
                              ),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: AppStrings.editProfileAddress,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              color: AppColors.midLightGrey,
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            SizedBox(
                              height: 13.w,
                              child: CustomTextField(
                                borderRadius: 3.w,
                                enabledBorderColor: AppColors.lightGrey,
                                focusedBorderColor: AppColors.kPrimaryColor,
                                validator: (value) => emailValidation(value),
                                controller: addressController,
                              ),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: AppStrings.bioDataPhoneNumber,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.3,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(
                              height: 2.w,
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
                            SizedBox(height: 20.w),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5.w,
            right: 5.w,
            left: 5.w,
            child: CustomElevatedButton(
              onPressed: () {
                //Navigation
              },
              label: AppStrings.editProfileSave,
              width: 88.w,
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
    );
  }
}
