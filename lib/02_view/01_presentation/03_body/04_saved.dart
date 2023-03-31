import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/01_apply_job_main.dart';
import 'package:jobsque/02_view/02_components/cards/saved_job_preview_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button_ver3.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_states.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved/saved_states.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/03_cubit/screens/saved/saved_cubit.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
/*    SavedCubit.get(context).showAllFavoritesFromAPI(
      token: AuthCubit.authorizationToken,
      userID: AuthCubit.get(context).userModel.id!,
      context: context,
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SavedCubit savedCubit = SavedCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            title: CustomText(
              text: AppStrings.savedScreenTitle,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.2,
              color: AppColors.kPrimaryBlack,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          BlocConsumer<SavedCubit, SavedStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if(state is GetFavoriteListSuccessState){
                return SliverToBoxAdapter(
                  child: BlocConsumer<NotificationCubit, NotificationStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.offWhite2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.w),
                              child: const CustomText(
                                text: 'New',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.4,
                                color: AppColors.grey,
                              ),
                            ),
                            Column(
                              children: List.generate(
                                savedCubit.savedJobs.length,
                                    (index) => SavedJobPreviewCard(
                                  jobModel: savedCubit.savedJobs[index],
                                  suffixIcon: AppAssets.savedJobsMoreIcon,
                                  saveOnPressed: () {
                                    showMaterialModalBottomSheet(
                                      ///////////////////
                                      useRootNavigator: true,
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5.w),
                                          topLeft: Radius.circular(5.w),
                                        ),
                                      ),
                                      builder: (context) => BlocProvider.value(
                                        value: savedCubit,
                                        child: SizedBox(
                                          height: 35.h,
                                          child: Padding(
                                            padding: EdgeInsets.all(5.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CustomElevatedButtonVer3(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                        context) =>
                                                            ApplyJobScreen(
                                                              jobModel: savedCubit
                                                                  .savedJobs[index],
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                  label: 'Apply Job',
                                                  icon: Image.asset(AppAssets.savedApplyJobFilterIcon,width: 7.w,height: 7.w,color: AppColors.iconsBlack,),
                                                  backgroundColor: AppColors.white,
                                                  iconColor: AppColors.iconsBlack,
                                                  labelColor:
                                                  AppColors.kPrimaryBlack,
                                                  width: double.infinity,
                                                  height: 12.w,
                                                  borderColor: AppColors.grey,
                                                  borderRadius: 10.w,
                                                  suffixIcon:
                                                  Icons.keyboard_arrow_right,
                                                  suffixIconColor:
                                                  AppColors.iconsBlack,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                ),
                                                CustomElevatedButtonVer3(
                                                  onPressed: () {},
                                                  label: 'Share via...',
                                                  icon: Image.asset(AppAssets.savedShareViaFilterIcon,width: 7.w,height: 8.w,color: AppColors.iconsBlack,),
                                                  backgroundColor: AppColors.white,
                                                  iconColor: AppColors.iconsBlack,
                                                  labelColor:
                                                  AppColors.kPrimaryBlack,
                                                  width: double.infinity,
                                                  height: 12.w,
                                                  borderColor: AppColors.grey,
                                                  borderRadius: 10.w,
                                                  suffixIcon:
                                                  Icons.keyboard_arrow_right,
                                                  suffixIconColor:
                                                  AppColors.iconsBlack,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                ),
                                                CustomElevatedButtonVer3(
                                                  onPressed: () {
                                                    savedCubit.deleteFavoriteFromAPIList(
                                                      token: AuthCubit.authorizationToken,
                                                      jobID: savedCubit.savedJobs[index].id!,
                                                    );
                                                    savedCubit.removeFromSavedJobs(
                                                      jobModel: savedCubit.savedJobs[index],
                                                    );
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  label: 'Cancel Save',
                                                  icon: Image.asset(AppAssets.bottomBarIcon[3],width: 7.w,height: 7.w,color: AppColors.iconsBlack,),
                                                  backgroundColor: AppColors.white,
                                                  iconColor: AppColors.iconsBlack,
                                                  labelColor:
                                                  AppColors.kPrimaryBlack,
                                                  width: double.infinity,
                                                  height: 12.w,
                                                  borderColor: AppColors.grey,
                                                  borderRadius: 10.w,
                                                  suffixIcon:
                                                  Icons.keyboard_arrow_right,
                                                  suffixIconColor:
                                                  AppColors.iconsBlack,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                    },
                  ),
                );
              }
              else{
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.noSavedJobsImage,
                              width: 50.w,
                              height: 50.w,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: AppStrings.noSavedTitle,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              color: AppColors.textsBlack,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            const CustomText(
                              text: AppStrings.noSavedSubTitle,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              color: AppColors.grey,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

            },
          ),
        ],
      ),
    );
  }
}
