import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/job_detail_tabs/01_apply_job_tab.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/02_components/cards/job_type_card.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../01_model/05_job_model/job_model.dart';
import '../../../../03_controller/00_navigation/routes.dart';
import '../../../../03_controller/03_cubit/screens/apply_job/apply_job_States.dart';
import '../../../../03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import '../../../03_widgets/custom_elevated_button.dart';
import 'job_detail_tabs/02_apply_job_tab.dart';
import 'job_detail_tabs/03_apply_job_tab.dart';

class ApplyJobScreen extends StatelessWidget {
  JobModel? jobModel;

  ApplyJobScreen({
    Key? key,
    this.jobModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplyJobCubit applyJobCubit = ApplyJobCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.jobDetail,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
        actions: [
          BlocConsumer<ApplyJobCubit, ApplyJobStates>(
            listener: (context, state) {},
            builder: (context, state) => IconButton(
              onPressed: () {
                applyJobCubit.changeSaveIcon();
              },
              padding: EdgeInsets.only(right: 3.w),
              icon: Image.asset(applyJobCubit.initialSaveIcon),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 190.w,
              child: DefaultTabController(
                length: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        jobModel!.photo ?? AppAssets.twitterLogo,
                        width: 13.w,
                        height: 13.w,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      CustomText(
                        text: jobModel!.title ?? AppStrings.applyJobTitle,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.2,
                        color: AppColors.kPrimaryBlack,
                      ),
                      CustomText(
                        text:
                        '${jobModel!.company ?? AppStrings.applyJobLocationCompany} • ${jobModel!.city ??AppStrings.applyJobLocationCity} , ${jobModel!.country ?? AppStrings.applyJobLocationCountry}',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.5,
                        color: AppColors.kPrimaryBlack,
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          JobTypeCard(
                            label: jobModel!.types![0],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: JobTypeCard(
                              label: jobModel!.types![1],
                            ),
                          ),
                          JobTypeCard(
                            label: jobModel!.types![2],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6.w,
                      ),
                      Container(
                        height: 10.w,
                        padding: EdgeInsets.all((1 / 2).w),
                        decoration: BoxDecoration(
                          color: AppColors.whiteGrey,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: TabBar(
                          indicator: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            color: AppColors.kLightDarkBlue,
                          ),
                          tabs: List.generate(
                            3,
                            (index) => Tab(
                              icon: CustomText(
                                text: AppStrings.applyJobTab[index],
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ),
                          onTap: (int index) {},
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.textsGrey,
                        ),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ApplyJobTab1(
                              jobDescription:
                              jobModel!.description ?? AppStrings.applyJobDescriptionSubTitle,
                              requiredSills: jobModel!.skills ?? AppStrings.applyJobRequiredSkills,
                            ),
                            ApplyJobTab2(
                              email: jobModel!.companyMail ?? AppStrings.applyJobCompanyEmail,
                              website: jobModel!.companyWebSite ?? AppStrings.applyJobCompanyWebSite,
                              aboutCompany: jobModel!.aboutCompany ?? AppStrings.applyJobCompanyAboutCompanySubTitle,
                            ),
                            ApplyJobTab3(
                              employees: AppConstants.employees,
                              positionList:
                                  AppStrings.applyJobPeopleFilterItems,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 20.w,
              decoration: BoxDecoration(
                  //color: Colors.white.withOpacity(0.5),
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.7),
                ],
              )),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.applyJobBioDataPageRoute);
                  },
                  label: AppStrings.applyJobApplyNowButton,
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
    );
  }
}
