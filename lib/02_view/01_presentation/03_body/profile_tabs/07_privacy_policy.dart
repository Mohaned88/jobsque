import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String text3 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String text2 = 'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String text1 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ';
  static const String textTitle1 = 'Your privacy is important';
  static const String textTitle2 = 'Data controllers and contract partners';
  static const String privacyPolicyTitle = 'Privacy Policy';

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
          text: privacyPolicyTitle,
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
                text: textTitle1,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.kPrimaryBlack,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text: text1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: AppColors.grey,
              ),
              SizedBox(height: 0.03*w,),
              const CustomText(
                text:text2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: AppColors.grey,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text: textTitle2,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.kPrimaryBlack,
              ),
              SizedBox(height: 0.04*w,),
              const CustomText(
                text: text3,
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