import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:sizer/sizer.dart';

import '../../../03_widgets/custom_text.dart';
import '../../../03_widgets/custom_text_field_ver2.dart';
import '../../../04_utilities/res/assets.dart';
import '../../../05_styles/colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const CustomText(
          text: AppStrings.profileHelpCenter,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.w),
            child: CustomTextFieldVer2(
              height: 14.w,
              prefixIcon: Image.asset(AppAssets.searchToolIcon),
              enabledBorderColor: AppColors.lightGrey,
              borderRadius: 20.w,
              focusedBorderColor: AppColors.kPrimaryColor,
              errorBorderColor: AppColors.red,
              hintText: AppStrings.helpCenterQuery,
              hintColor: AppColors.textsGrey,
              hintHeight: 1.4,
              cursorHeight: 5.w,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(5.w),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(4.w),
                  margin: EdgeInsets.only(bottom: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      color: AppColors.lightGrey,
                    )
                  ),
                  child: ExpandablePanel(
                    header: const CustomText(
                      text: AppStrings.helpCenterSuggestionTitle,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.3,
                      color: AppColors.kPrimaryBlack,
                    ),
                    expanded: const CustomText(
                      text: AppStrings.helpCenterSuggestionDescription,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.grey,
                    ),
                    collapsed: const SizedBox(),
                    theme: const ExpandableThemeData(
                      alignment: Alignment.center,
                      bodyAlignment: ExpandablePanelBodyAlignment.center,
                      iconPadding: EdgeInsets.all(0)
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
