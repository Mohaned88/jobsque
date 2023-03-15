import 'package:flutter/material.dart';
import 'package:jobsque/01_model/02_country_model/country_model.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

class CountryCard extends StatelessWidget {
  final CountryModel? countryModel;
  final GestureTapCallback? onTap;
  final Color? borderColor;
  final Color? fillColor;

  const CountryCard({
    Key? key,
    this.countryModel,
    this.onTap,
    this.borderColor,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 3.w,bottom: 3.w),
        child: Container(
          height: 11.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(7.w),
            color: fillColor ?? AppColors.offWhite,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                countryModel!.flag ?? '',
                width: 7.w,
                height: 7.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              CustomText(
                text: countryModel!.countryName ?? '',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.3,
                color: AppColors.kPrimaryBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
