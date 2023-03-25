import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class LoginNSecurityWidget extends StatelessWidget {
  final String settingTitle;
  final String? description;
  final GestureTapCallback? onTap;

  const LoginNSecurityWidget({
    Key? key,
    required this.settingTitle,
    this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.w,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
                    color: AppColors.kPrimaryBlack,
                  ),
                ),
                if (description != null) ...[
                  CustomText(
                    text: description ?? '',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.grey,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
                SizedBox(width: 2.w),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.iconsBlack,
                ),
              ],
            ),
            SizedBox(height: 2.w),
            const Divider(color: AppColors.midLightGrey),
          ],
        ),
      ),
    );
  }
}
