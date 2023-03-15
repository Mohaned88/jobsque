import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/01_apply_job_main.dart';
import 'package:jobsque/02_view/02_components/cards/job_preview_card.dart';
import 'package:jobsque/02_view/02_components/cards/notification_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_elevated_button_ver2.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_states.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved_cubit/saved_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    SavedCubit savedCubit = SavedCubit.get(context);
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
                color: AppColors.iconsBlack,
              ),
            ),
            title: const CustomText(
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
          SliverToBoxAdapter(
            child: BlocConsumer<NotificationCubit, NotificationStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (savedCubit.savedJobs.isEmpty) {
                    return Column(
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
                    );
                  } else {
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
                            (index) => JobPreviewCard(
                              jobModel: savedCubit.savedJobs[index],
                              suffixIcon: AppAssets.savedJobsMoreIcon,
                              saveOnPressed: () {
                                showModalBottomSheet( ///////////////////
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
                                    child: Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomElevatedButtonVer2(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext context) => ApplyJobScreen(
                                                    jobModel: savedCubit.savedJobs[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            label: 'Apply Job',
                                            icon: Icons.cases,
                                            backgroundColor: AppColors.white,
                                            iconColor: AppColors.iconsBlack,
                                            labelColor: AppColors.kPrimaryBlack,
                                            width: double.infinity,
                                            height: 12.w,
                                            borderColor: AppColors.grey,
                                            borderRadius: 10.w,
                                            suffixIcon: Icons.keyboard_arrow_right,
                                            suffixIconColor: AppColors.iconsBlack,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          ),
                                          CustomElevatedButtonVer2(
                                            onPressed: () {},
                                            label: 'Share via...',
                                            icon: Icons.cases,
                                            backgroundColor: AppColors.white,
                                            iconColor: AppColors.iconsBlack,
                                            labelColor: AppColors.kPrimaryBlack,
                                            width: double.infinity,
                                            height: 12.w,
                                            borderColor: AppColors.grey,
                                            borderRadius: 10.w,
                                            suffixIcon: Icons.keyboard_arrow_right,
                                            suffixIconColor: AppColors.iconsBlack,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          ),
                                          CustomElevatedButtonVer2(
                                            onPressed: () {
                                              savedCubit.removeFromSavedJobs(
                                                jobModel: savedCubit.savedJobs[index],
                                              );
                                              Navigator.pop(context);
                                              setState(() {
                                                
                                              });
                                            },
                                            label: 'Cancel Save',
                                            icon: Icons.cases,
                                            backgroundColor: AppColors.white,
                                            iconColor: AppColors.iconsBlack,
                                            labelColor: AppColors.kPrimaryBlack,
                                            width: double.infinity,
                                            height: 12.w,
                                            borderColor: AppColors.grey,
                                            borderRadius: 10.w,
                                            suffixIcon: Icons.keyboard_arrow_right,
                                            suffixIconColor: AppColors.iconsBlack,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          ),
                                        ],
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
                  }
                }),
          ),
        ],
      ),
    );
  }
}
