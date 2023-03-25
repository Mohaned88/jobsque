import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              text: AppStrings.profileNotification,
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
            child: Container(
              height: 10.w,
              width: double.infinity,
              color: AppColors.offWhite2,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Align(
                alignment: FractionalOffset.centerLeft,
                child: CustomText(
                  text: AppStrings.notificationJobNotification,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
