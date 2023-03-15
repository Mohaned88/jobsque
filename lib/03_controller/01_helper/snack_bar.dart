import 'package:flutter/material.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../02_view/03_widgets/custom_text.dart';

var snackBarError = SnackBar(
  backgroundColor: AppColors.red,
  duration: const Duration(seconds: 3),
  content: Row(
    children: [
      const Icon(
        Icons.highlight_remove,
        color: AppColors.white,
      ),
      SizedBox(
        width: 5.w,
      ),
      const CustomText(
        text: 'Wrong email or password!',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
    ],
  ),
);

var snackBarSuccess = SnackBar(
  backgroundColor: AppColors.green,
  duration: const Duration(seconds: 3),
  content: Row(
    children: [
      const Icon(
        Icons.done,
        color: AppColors.white,
      ),
      SizedBox(
        width: 5.w,
      ),
      const CustomText(
        text: 'Successful',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
    ],
  ),
);
