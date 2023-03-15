import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/cards/work_type_large_card.dart';
import 'package:jobsque/02_view/02_components/custom_toggle_switch.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/location_selection/preferred_loaction_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/location_selection/preferred_location_states.dart';
import 'package:jobsque/03_controller/03_cubit/screens/type_selection/work_type_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/03_cubit/auth/auth_states.dart';
import '../../02_components/cards/country_card.dart';
import '../../03_widgets/custom_elevated_button.dart';
import '../../03_widgets/custom_text.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrefLocationCubit prefLocationCubit = PrefLocationCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    WorkTypeCubit workTypeCubit = WorkTypeCubit.get(context);
    return Scaffold(
      body: DefaultTabController(
        length: AppStrings.locationType.length,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const CustomText(
                            text: AppStrings.locationQuestion,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryBlack,
                            height: 1.4,
                          ),
                          SizedBox(
                            height: 3.w,
                          ),
                          const CustomText(
                            text: AppStrings.locationSubTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textsGrey,
                            height: 1.3,
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: TabBar(
                              indicator: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                color: AppColors.kDarkBlue,
                              ),
                              tabs: List.generate(
                                AppStrings.locationType.length,
                                (index) => Tab(
                                  icon: CustomText(
                                    text: AppStrings.locationType[index],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              onTap: (int index) {},
                              labelColor: AppColors.white,
                              unselectedLabelColor: AppColors.kPrimaryBlack,
                            ),
                          ), /////////////////////////////TabBar
                          SizedBox(
                            height: 8.w,
                          ),
                          const CustomText(
                            text: AppStrings.selectTheCountryYouWantForYourJob,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textsGrey,
                            height: 1.3,
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          BlocConsumer<PrefLocationCubit, PrefLocationStates>(
                            listener: (context, state) {},
                            builder: (context, state) => SizedBox(
                              width: double.infinity,
                              height: 100.w,
                              child: TabBarView(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      AppConstants.countries.length,
                                      (index) => CountryCard(
                                        countryModel:
                                            AppConstants.countries[index],
                                        borderColor: prefLocationCubit
                                            .offlineBorderColor[index],
                                        fillColor: prefLocationCubit
                                            .offlineFillColor[index],
                                        onTap: () {
                                          prefLocationCubit
                                              .countryCardColorChange(
                                            index,
                                            location: 'offline',
                                            countryName: AppConstants.countries[index].countryName!,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                    children: List.generate(
                                      AppConstants.countries.length,
                                      (index) => CountryCard(
                                        countryModel:
                                            AppConstants.countries[index],
                                        borderColor: prefLocationCubit
                                            .onlineBorderColor[index],
                                        fillColor: prefLocationCubit
                                            .onlineFillColor[index],
                                        onTap: () {
                                          prefLocationCubit
                                              .countryCardColorChange(
                                            index,
                                            location: 'online',
                                            countryName: AppConstants.countries[index].countryName!,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.w),
                    child: BlocConsumer<AuthCubit,AuthStates>(
                      listener: (context,state){
                        if(state is CollectedDataSuccessState){
                          Navigator.pushNamed(
                              context, AppRoutes.setUpSuccessRoute);
                        }
                      },
                      builder: (context,state)=> CustomElevatedButton(
                        onPressed: () {
                          authCubit.putSelectedWorkType(
                            userId: authCubit.userModel!.id,
                            workType: workTypeCubit.selectedWorkTypeTitles,
                            offlinePlace: prefLocationCubit.offlineLocations,
                            onlinePlace: prefLocationCubit.remoteLocations,
                          );
                        },
                        label: AppStrings.onBoardingNext,
                        width: 88.w,
                        alignment: Alignment.center,
                        height: 13.w,
                        borderRadius: 10.w,
                        backgroundColor: AppColors.kPrimaryColor,
                        labelFontSize: 16,
                        labelFontWeight: FontWeight.w500,
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
