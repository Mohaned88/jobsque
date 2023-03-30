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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'Visit job post',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[0],
                height: 7.w,
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
            SizedBox(height: 4.w),
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'View my application',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[1],
                height: 7.w,
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
            SizedBox(height: 4.w),
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'Mark as unread',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[2],
                height: 7.w,
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
            SizedBox(height: 4.w),
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'Mute',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[3],
                height: 7.w,
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
            SizedBox(height: 4.w),
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'Archive',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[4],
                height: 7.w,
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
            SizedBox(height: 4.w),
            CustomElevatedButtonVer3(
              onPressed: () {},
              label: 'Delete conversation',
              icon: Image.asset(
                AppAssets.chatScreenFilterIcon[5],
                height: 7.w,
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
    );
  }
}
