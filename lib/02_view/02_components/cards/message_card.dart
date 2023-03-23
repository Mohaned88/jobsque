import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final DateTime dateTime;
  final String? isIncoming;

  const MessageCard({
    Key? key,
    required this.message,
    required this.dateTime,
    required this.isIncoming,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIncoming == 'company') {
      return Padding(
        padding: EdgeInsets.only(left: 4.w,right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(bottom: 3.w),
                decoration: BoxDecoration(
                  color: AppColors.offWhite2,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3.w),
                    bottomLeft: Radius.circular(3.w),
                    topRight: Radius.circular(3.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: message,
                        color: AppColors.kPrimaryBlack,
                        textAlign: TextAlign.left,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: DateFormat.Hm().format(dateTime),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: AppColors.midLightGrey,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 10.w,right: 4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: SizedBox()),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(bottom: 3.w),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3.w),
                    bottomLeft: Radius.circular(3.w),
                    topLeft: Radius.circular(3.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: message,
                        color: AppColors.whiteGrey,
                        textAlign: TextAlign.left,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: DateFormat.Hm().format(dateTime),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: AppColors.offWhite2,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
