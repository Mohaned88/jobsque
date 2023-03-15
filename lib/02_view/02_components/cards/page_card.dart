import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../03_widgets/custom_text.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class PageCard extends StatelessWidget {

  final String imagePath;
  final String mainText;
  final String pattern;
  final String subText;

  PageCard({
    Key? key,
    required this.imagePath,
    required this.mainText,
    required this.pattern,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 10,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EasyRichText(
                 mainText,
                  defaultStyle: const TextStyle(
                    color: AppColors.kPrimaryBlack,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: pattern,
                      style: const TextStyle(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: subText,
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
