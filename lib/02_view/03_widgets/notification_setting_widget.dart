import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../04_utilities/res/strings.dart';
import '../05_styles/colors.dart';
import 'custom_text.dart';

class NotificationSettingWidget extends StatelessWidget {
  bool? value;
  final String settingTitle;
  final ValueChanged<bool> onToggle;

  NotificationSettingWidget({
    Key? key,
    this.value = true,
    required this.settingTitle,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.w,
      margin: EdgeInsets.only(bottom: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomText(
                  text: settingTitle,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.3,
                  color: AppColors.kPrimaryBlack,
                ),
              ),
              FlutterSwitch(
                value: value ?? false,
                onToggle: onToggle,
                width: 12.w,
                height: 7.w,
                toggleSize: 6.w,
                padding: (0.7).w,
                activeColor: AppColors.kPrimaryColor,
                inactiveColor: AppColors.lightGrey,
              ),
            ],
          ),
          SizedBox(height: 2.w,),
          const Divider(
            color: AppColors.midLightGrey,
          ),
        ],
      ),
    );
  }
}
