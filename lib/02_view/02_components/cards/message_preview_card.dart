import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../04_utilities/res/strings.dart';

class MessagePreviewCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  const MessagePreviewCard({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.w, horizontal: 4.w),
        width: double.infinity,
        height: 21.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 15.w,
                      height: 15.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.twitterLogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                      /*child: Image.asset(
                      AppAssets.twitterLogo,
                      fit: BoxFit.cover,
                    ),*/
                    ),
                    Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPrimaryColor,
                        border: Border.all(
                          color: AppColors.white,
                        ),
                      ),
                      child: CustomText(
                        text: '1',
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      CustomText(
                        text: AppStrings.messagesScreenTitle,
                      ),
                      CustomText(
                        text: AppStrings.messagesScreenTitle,
                      ),
                    ],

                  ),
                ),
                CustomText(
                  text: '${DateTime.now().hour}:${DateTime.now().minute}',
                ),
              ],
            ),
            SizedBox(
              width: 75.w,
              height: 1.w,
              child: const Divider(
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
