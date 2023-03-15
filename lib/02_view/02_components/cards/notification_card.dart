import 'package:flutter/material.dart';
import 'package:jobsque/01_model/06_notification_model/notification_model.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel? notificationModel;

  const NotificationCard({
    Key? key,
    this.notificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.w),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
        leading: Image.asset(
          AppAssets.twitterLogo,
          width: 13.w,
          height: 13.w,
        ),
        title: CustomText(
          text: notificationModel!.title!,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.4,
          color: AppColors.kPrimaryBlack,
        ),
        subtitle: CustomText(
          text: notificationModel!.description!,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.5,
          color: AppColors.grey,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 3.w,
              height: 3.w,
              margin: EdgeInsets.only(right: 2.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gold,
              ),
            ),
            CustomText(
              text: notificationModel!.time!,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.5,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
