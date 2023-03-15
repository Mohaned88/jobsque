import 'package:flutter/material.dart';
import 'package:jobsque/01_model/01_work_model/work_model.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class WorkTypeCard extends StatelessWidget {
  final WorkTypeModel? workTypeModel;
  final GestureTapCallback? onTap;
  final Color? borderColor;
  final Color? fillColor;
  final Color? iconColor;

  const WorkTypeCard({
    Key? key,
    this.workTypeModel,
    this.onTap,
    this.borderColor,
    this.fillColor = AppColors.offWhite,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: fillColor,
          border: Border.all(
            color: borderColor ?? AppColors.lightGrey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                border: Border.all(
                  color: borderColor ?? AppColors.lightGrey,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                workTypeModel!.photo ?? '',
                color: iconColor,
              ),
            ),
            CustomText(
              text: workTypeModel!.title ?? '',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textsBlack,
            ),
          ],
        ),
      ),
    );
  }
}
