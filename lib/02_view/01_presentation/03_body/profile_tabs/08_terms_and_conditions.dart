import 'package:flutter/material.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';

import '../../../03_widgets/custom_text.dart';

class TermsNConditionsScreen extends StatelessWidget {
  static const String text4 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String text3 =
      'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String text2 =
      'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ';
  static const String text1 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String textTitle = 'Lorem ipsum dolor';
  static const String termsNConditionsTitle = 'Terms & Conditions';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
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
          text: termsNConditionsTitle,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            height: 1.2,
            color: AppColors.kPrimaryBlack,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.04*w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomText(
                text:textTitle,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.kPrimaryBlack,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text:text1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: AppColors.grey,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text:textTitle,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.kPrimaryBlack,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text:text2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: AppColors.grey,
              ),
              SizedBox(height: 0.04*w,),
              Container(
                padding: EdgeInsets.all(0.04*w),
                color: const Color(0xffF4F4F5),
                child: const CustomText(
                  text:text3,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.grey,
                ),
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text:text4,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: AppColors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}