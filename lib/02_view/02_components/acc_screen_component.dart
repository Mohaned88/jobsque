import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/03_widgets/auth_button.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/03_widgets/text_inkwell.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/button/account_button_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/button/account_button_states.dart';
import 'package:sizer/sizer.dart';

class AccScreenComp extends StatelessWidget {
  final String? compLabel;
  final String? directoryTitle;
  final String? buttonLabel;
  final String? replacementAuthLAbel;
  final VoidCallback directoryOnTap;
  final VoidCallback? buttonOnPressed;
  final VoidCallback googleAuthOnPressed;
  final VoidCallback facebookAuthOnPressed;

  const AccScreenComp({
    Key? key,
    this.compLabel = AppStrings.loginForwardMessage,
    this.directoryTitle = AppStrings.loginTitle,
    this.buttonLabel = AppStrings.createAccount,
    this.replacementAuthLAbel = AppStrings.orSignupWithAccount,
    required this.directoryOnTap,
    required this.buttonOnPressed,
    required this.googleAuthOnPressed,
    required this.facebookAuthOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccButtonCubit accButtonCubit = AccButtonCubit.get(context);
    return SizedBox(
      width: double.infinity,
      height: 60.w,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextInkwell(
            alignment: MainAxisAlignment.center,
            labelText: compLabel!,
            onTap: directoryOnTap,
            directoryText: directoryTitle!,
            labelColor: AppColors.midLightGrey,
            directoryColor: AppColors.kPrimaryColor,
            directoryFontSize: 14,
            directoryFontWeight: FontWeight.w500,
            labelFontSize: 14,
            labelFontWeight: FontWeight.w500,
          ),
          BlocConsumer<AccButtonCubit,AccButtonStates>(
            listener: (BuildContext context, state) {  },
            builder: (BuildContext context, Object? state) => CustomElevatedButton(
              onPressed: buttonOnPressed,
              label: buttonLabel!,
              labelColor: accButtonCubit.labelColor,
              labelFontSize: 16,
              labelFontWeight: FontWeight.w500,
              width: double.infinity,
              height: 13.w,
              alignment: Alignment.center,
              backgroundColor: accButtonCubit.backgroundColor,
              borderRadius: 10.w,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Divider(thickness: (1 / 3).w)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: CustomText(
                  text: replacementAuthLAbel!,
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(child: Divider(thickness: (1 / 3).w)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: AuthButton(
                  alignment: Alignment.center,
                  onPressed: googleAuthOnPressed,
                  icon: Image.asset(AppAssets.googleLogoPath, width: 5.w),
                  label: AppStrings.googleTitle,
                  backgroundColor: Colors.transparent,
                  borderSideColor: AppColors.lightGrey,
                  borderSideWidth: (1 / 3).w,
                  labelColor: AppColors.textsBlack,
                  labelFontSize: 14,
                  labelFontWeight: FontWeight.w500,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 12.w,
                  borderRadius: 2.w,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: AuthButton(
                  alignment: Alignment.center,
                  onPressed: facebookAuthOnPressed,
                  icon: Image.asset(AppAssets.facebookLogoPath, width: 6.w),
                  label: AppStrings.facebookTitle,
                  backgroundColor: Colors.transparent,
                  borderSideColor: AppColors.lightGrey,
                  borderSideWidth: (1 / 3).w,
                  labelColor: AppColors.textsBlack,
                  labelFontSize: 14,
                  labelFontWeight: FontWeight.w500,
                  //width: MediaQuery.of(context).size.width*0.45,
                  height: 12.w,
                  borderRadius: 2.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
