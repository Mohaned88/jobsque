import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_elevated_button_ver3.dart';
import '../04_utilities/res/assets.dart';
import '../05_styles/colors.dart';

class MessagesFilterBottomSheet extends StatelessWidget {
  const MessagesFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 5.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'Visit job post',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 4.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'View my application',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 4.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'Mark as unread',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 4.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'Mute',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 4.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'Archive',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 4.w,
              ),
              CustomElevatedButtonVer3(
                onPressed: () {},
                label: 'Delete conversation',
                icon: Image.asset(
                  AppAssets.pinIcon,
                  height: 44,
                  fit: BoxFit.cover,
                ),
                backgroundColor: AppColors.white,
                iconColor: AppColors.iconsBlack,
                labelColor: AppColors.kPrimaryBlack,
                width: double.infinity,
                height: 12.w,
                borderColor: AppColors.lightGrey,
                borderRadius: 10.w,
                suffixIcon: Icons.keyboard_arrow_right,
                suffixIconColor: AppColors.iconsBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
