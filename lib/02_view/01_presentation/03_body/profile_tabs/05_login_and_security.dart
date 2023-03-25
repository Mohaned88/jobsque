import 'package:flutter/material.dart';
import 'package:jobsque/02_view/03_widgets/login_and_security_widget.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../03_controller/00_navigation/routes.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class LoginNSecurityScreen extends StatelessWidget {
  const LoginNSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.kPrimaryBlack,
              ),
            ),
            title: const CustomText(
              text: AppStrings.profileLoginAndSecurity,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.2,
              color: AppColors.kPrimaryBlack,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10.w,
              width: double.infinity,
              color: AppColors.offWhite2,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Align(
                alignment: FractionalOffset.centerLeft,
                child: CustomText(
                  text: AppStrings.loginNSecurityAccountAccess,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                LoginNSecurityWidget(
                  settingTitle: AppStrings.loginNSecurityEmailAddress,
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.profileLoginNSecurityEmailAddressRoute);
                  },
                  description: authCubit.userModel.email,
                ),
                LoginNSecurityWidget(
                  settingTitle: AppStrings.loginNSecurityPhoneNumber,
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.profileLoginNSecurityPhoneNoRoute);
                  },
                ),
                LoginNSecurityWidget(
                  settingTitle: AppStrings.loginNSecurityChangePassword,
                  onTap: (){},
                ),
                LoginNSecurityWidget(
                  settingTitle: AppStrings.loginNSecurity2StepVerification,
                  onTap: (){},
                  description: 'Non Active',
                ),
                LoginNSecurityWidget(
                  settingTitle: AppStrings.loginNSecurityFaceID,
                  onTap: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
