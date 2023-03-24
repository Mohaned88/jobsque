import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_states.dart';
import 'package:sizer/sizer.dart';

import '../../02_components/cards/profile_settings_card.dart';
import '../../03_widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPCubit sharedPCubit = SharedPCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: BlocConsumer<SharedPCubit, SharedPStates>(
        listener: (context, state) {},
        builder: (context, state) => CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: const CustomText(
                text: AppStrings.profileScreenTitle,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 1.2,
                color: AppColors.kPrimaryBlack,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(2.w),
                  icon: Image.asset(
                    AppAssets.profileLogout,
                    color: AppColors.red,
                    width: 7.w,
                    height: 7.w,
                  ),
                ),
              ],
              backgroundColor: AppColors.kBlue200,
              elevation: 0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    width: double.infinity,
                    height: 30.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 18.w,
                            width: double.infinity,
                            color: AppColors.kBlue200,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: (1.25).w,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.profileStandardImage),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), // Profile Picture
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: authCubit.userModel.name!,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          height: 1.2,
                          color: AppColors.kPrimaryBlack,
                          textAlign: TextAlign.center,
                        ),
                        CustomText(
                          text: authCubit.userModel.email!,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: AppColors.grey,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ), // User Name & Email
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CustomText(
                              text: AppStrings.profileApplied,
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: '46',
                              color: AppColors.kPrimaryBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (0.15).w,
                        height: 14.w,
                        color: AppColors.kPrimaryBlack,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CustomText(
                              text: AppStrings.profileReviewed,
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: '23',
                              color: AppColors.kPrimaryBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (0.15).w,
                        height: 14.w,
                        color: AppColors.kPrimaryBlack,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CustomText(
                              text: AppStrings.profileContacted,
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,

                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: '16',
                              color: AppColors.kPrimaryBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // Applied & Reviewed & Contacted
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 4.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: CustomText(
                                text: AppStrings.profileAbout,
                                color: AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const CustomText(
                                text: AppStrings.profileEdit,
                                color: AppColors.kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.w),
                        const CustomText(
                          text: AppStrings.profileAboutInfo,
                          color: AppColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                        SizedBox(height: 6.w),
                      ],
                    ),
                  ), // About Info
                  Container(
                    height: 10.w,
                    width: double.infinity,
                    color: AppColors.offWhite2,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Align(
                      alignment: FractionalOffset.centerLeft,
                      child: CustomText(
                        text: AppStrings.profileGeneral,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ), // General
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileSettingsCard(
                          hasIcon: true,
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.profileEditProfileRoute);
                          },
                          title: AppStrings.profileEditProfile,
                          icon: AppAssets.profileEditProfileImage,
                        ),
                        ProfileSettingsCard(
                          hasIcon: true,
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.profilePortfolioRoute);
                          },
                          title: AppStrings.profilePortfolio,
                          icon: AppAssets.profilePortfolioImage,
                        ),
                        ProfileSettingsCard(
                          hasIcon: true,
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.profileLanguageSelectionRoute);
                          },
                          title: AppStrings.profileLanguage,
                          icon: AppAssets.profileLanguagesImage,
                        ),
                        ProfileSettingsCard(
                          hasIcon: true,
                          onTap: (){},
                          title: AppStrings.profileNotification,
                          icon: AppAssets.profileNotificationImage,
                        ),
                        ProfileSettingsCard(
                          hasIcon: true,
                          onTap: (){},
                          title: AppStrings.profileLoginAndSecurity,
                          icon: AppAssets.profileLoginNSecurityImage,
                        ),
                      ],
                    ),
                  ), // with icon
                  Container(
                    height: 10.w,
                    width: double.infinity,
                    color: AppColors.offWhite2,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Align(
                      alignment: FractionalOffset.centerLeft,
                      child: CustomText(
                        text: AppStrings.profileOthers,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ), // Others
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileSettingsCard(
                          hasIcon: false,
                          onTap: (){},
                          title: AppStrings.profileAccessibility,
                        ),
                        ProfileSettingsCard(
                          hasIcon: false,
                          onTap: (){},
                          title: AppStrings.profileHelpCenter,
                        ),
                        ProfileSettingsCard(
                          hasIcon: false,
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.profileTermsNConditionsRoute);
                          },
                          title: AppStrings.profileTermsNConditions,
                        ),
                        ProfileSettingsCard(
                          hasIcon: false,
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.profilePrivacyPolicyRoute);
                          },
                          title: AppStrings.profilePrivacyPolicy,
                        ),
                      ],
                    ),
                  ), // without icon
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
