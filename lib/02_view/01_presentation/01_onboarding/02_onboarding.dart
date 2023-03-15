import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/cards/page_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../03_controller/00_navigation/routes.dart';
import '../../../03_controller/03_cubit/widgets/onboarding/onboarding_button_cubit.dart';
import '../../../03_controller/03_cubit/widgets/onboarding/onboarding_button_states.dart';
import '../../03_widgets/custom_text.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    OnBoardingButtonCubit cubit = OnBoardingButtonCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 15,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      cubit.changeButtonText(index);
                      cubit.pageIndex = index;
                      return PageCard(
                        imagePath: AppAssets.onBoardingImages[index],
                        mainText: AppStrings.onBoardingTexts[index],
                        pattern: AppStrings.onBoardingPatterns[index],
                        subText: AppStrings.onBoardingSubTexts[index],
                      );
                    },
                  ),
                  Positioned(
                    top: 15,
                    left: 3.w,
                    right: 1.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.logoPath),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.logInRoute,
                                );
                              },
                              child: const CustomText(
                                text: AppStrings.onBoardingSkip,
                                color: AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        activeDotColor: AppColors.kPrimaryColor,
                        dotColor: AppColors.kBlue300,
                        dotWidth: 2.w,
                        dotHeight: 2.w,
                        spacing: 1.w,
                      ),
                    ),
                    BlocConsumer<OnBoardingButtonCubit, OnBoardingButtonStates>(
                      builder: (BuildContext context, state) {
                        return CustomElevatedButton(
                          onPressed: () {
                            if (cubit.pageIndex == 2) {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.logInRoute,
                              );
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                          label: cubit.buttonText,
                          width: 88.w,
                          alignment: Alignment.center,
                          height: 13.w,
                          borderRadius: 10.w,
                          backgroundColor: AppColors.kPrimaryColor,
                          labelFontSize: 16,
                          labelFontWeight: FontWeight.w500,
                        );
                      },
                      listener: (BuildContext context, Object? state) {},
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
