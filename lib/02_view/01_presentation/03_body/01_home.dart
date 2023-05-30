import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/05_job_model/job_model.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/01_apply_job_main.dart';
import 'package:jobsque/02_view/02_components/cards/job_preview_card.dart';
import 'package:jobsque/02_view/02_components/cards/suggested_job_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field_ver2.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_states.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '../../../03_controller/03_cubit/screens/saved/saved_cubit.dart';
import '../../../03_controller/03_cubit/screens/saved/saved_states.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getRecentJobList(token: AuthCubit.authorizationToken);
    HomeCubit.get(context).getSuggestJobList(
        token: AuthCubit.authorizationToken,
        userID: AuthCubit.get(context).userModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    SavedCubit savedCubit = SavedCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                '${AppStrings.homeScreenTitle}${authCubit.userModel.name}👋',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            height: 1.4,
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          const CustomText(
                            text: AppStrings.homeScreenSubTitle,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGrey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.notificationsPageRoute);
                          },
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            size: 7.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.w),
                    child: CustomTextFieldVer2(
                      height: 12.w,
                      prefixIcon: Image.asset(AppAssets.searchToolIcon),
                      enabledBorderColor: AppColors.lightGrey,
                      borderRadius: 20.w,
                      focusedBorderColor: AppColors.kPrimaryColor,
                      errorBorderColor: AppColors.red,
                      hintText: AppStrings.homeScreenSearch,
                      hintColor: AppColors.textsGrey,
                      hintHeight: 1.4,
                      cursorHeight: 5.w,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.searchPageRoute);
                      },
                    ),
                  ),
                ),
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (homeCubit.suggestJobs.isNotEmpty) {
                      return SliverToBoxAdapter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: AppStrings.homeScreenSuggestedJob,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  height: 1.3,
                                  color: AppColors.kPrimaryBlack,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const CustomText(
                                    text: AppStrings.homeScreenViewAll,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.w),
                            SizedBox(
                              height: 50.w,
                              child: BannerCarousel(
                                viewportFraction: 0.9,
                                showIndicator: false,
                                disableColor: Colors.green,
                                indicatorBottom: false,
                                margin: const EdgeInsets.all(0),
                                height: 50.w,
                                onPageChanged: (int index) {
                                  homeCubit.changeEnabledItemColor(index);
                                },
                                customizedBanners: List.generate(
                                  homeCubit.suggestJobs.length,
                                  (index) => SuggestedJobCard(
                                    fillColor: homeCubit.itemColors[index],
                                    jobModel: homeCubit.suggestJobs[index],
                                    saveOnPressed: () {
                                      savedCubit.addToFavoritesInAPI(
                                        token: AuthCubit.authorizationToken,
                                        userID: authCubit.userModel.id!,
                                        jobID: homeCubit.suggestJobs[index].id!,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(child: SizedBox());
                    }
                  },
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: AppStrings.homeScreenRecentJobs,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1.3,
                          color: AppColors.kPrimaryBlack,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const CustomText(
                            text: AppStrings.homeScreenViewAll,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<SavedCubit,SavedStates>(
                  listener: (context,state){},
                  builder: (context,state)=> BlocConsumer<HomeCubit, HomeStates>(
                    listener: (context, state) {},
                    builder: (context, state) => SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(
                          homeCubit.recentJobs.length,
                              (index) => JobPreviewCard(
                            jobModel: homeCubit.recentJobs[index],
                            saveOnPressed: () {
                              List<int> jodIDs =[];
                              savedCubit.savedJobs.forEach((element) {jodIDs.add(element.jobId!);},);
                              print(jodIDs);
                              if(jodIDs.contains(homeCubit.recentJobs[index].id)){
                                List<JobModel> x = savedCubit.savedJobs.where((element) => element.jobId==homeCubit.recentJobs[index].id).toList();
                                x.forEach((element) {
                                  savedCubit.deleteFavoriteFromAPIList(
                                    token: AuthCubit.authorizationToken,
                                    jobID: element.id!,
                                  );
                                });
                                homeCubit.recentJobsSaveIcons[index] = AppAssets.bottomBarIcon[3];
                                print('delete');

                              }
                              else{
                                savedCubit.addToFavoritesInAPI(
                                  token: AuthCubit.authorizationToken,
                                  userID: authCubit.userModel.id!,
                                  jobID: homeCubit.recentJobs[index].id!,
                                );
                                homeCubit.recentJobsSaveIcons[index] = AppAssets.bottomBarActiveIcon[3];
                                print('add');
                              }
                            },
                            gestureOnTap: () {
                              ApplyJobCubit.get(context).selectedJobId = homeCubit.recentJobs[index].id!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ApplyJobScreen(
                                        jobModel: homeCubit.recentJobs[index],
                                      ),
                                ),
                              );
                            },
                            suffixIcon: homeCubit.recentJobsSaveIcons[index],
                            suffixIconColor:homeCubit.recentJobsSaveIcons[index] == AppAssets.bottomBarActiveIcon[3] ? AppColors.kPrimaryColor : AppColors.midLightGrey,
                          ),
                        ),
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
