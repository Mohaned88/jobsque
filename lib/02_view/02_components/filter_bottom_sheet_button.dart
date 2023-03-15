import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../03_widgets/custom_elevated_button.dart';
import 'cards/job_type_card.dart';

class FilterBottomSheetBtn extends StatelessWidget {

  final String? title;

  const FilterBottomSheetBtn({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: FilterChip(
        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.lightGrey,
        ),
        label: Row(
          children: [
            CustomText(
              text: title ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1.4,
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.iconsBlack,
            ),
          ],
        ),
        onSelected: (value) {
          showMaterialModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.w),
                topLeft: Radius.circular(5.w),
              ),
            ),
            builder: (context) => SizedBox(
              height: 60.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CustomText(
                      text: 'Remote',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      height: 1.3,
                      color: AppColors.kPrimaryBlack,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        4,
                            (index) => JobTypeCard(
                              label: 'Remote',
                              horizontalPadding: 5.w,
                              labelColor: AppColors.kPrimaryColor,
                              fillColor: AppColors.kBlue200,
                              borderColor: AppColors.kPrimaryColor,
                              onTap: (){},
                            ),
                      ),
                    ),
                    CustomElevatedButton(
                      height: 13.w,
                      width: double.infinity,
                      borderRadius: 10.w,
                      backgroundColor: AppColors.kPrimaryColor,
                      alignment: Alignment.center,
                      onPressed: () {},
                      label: 'Show Result',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
