import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/cards/work_type_large_card.dart';
import 'package:jobsque/02_view/03_widgets/application_steps.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_States.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../03_controller/00_navigation/routes.dart';
import '../../../03_widgets/custom_elevated_button.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({Key? key}) : super(key: key);

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {

  @override
  void initState() {
    ApplyJobCubit.get(context).applyUserModel.interestedWork = [];
    super.initState();
  }

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
          text: AppStrings.bioDataApplyJob,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 163.w,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ApplicationSteps(
                          stepNumber: 2,
                        ),
                        SizedBox(height: 6.w),
                        CustomText(
                          text: AppStrings.bioDataStepTitle[1],
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          height: 1.2,
                          color: AppColors.kPrimaryBlack,
                        ),
                        SizedBox(height: 2.w),
                        const CustomText(
                          text: AppStrings.bioDataSubTitle,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: AppColors.grey,
                        ),
                        SizedBox(height: 6.w),
                        Expanded(
                          child: BlocConsumer<ApplyJobCubit, ApplyJobStates>(
                            listener: (BuildContext context, state) {},
                            builder: (BuildContext context, state) {
                              return ListView.separated(
                                itemCount: AppStrings.applyJobWorkTypeJobTitles.length,
                                itemBuilder: (BuildContext context, int index) =>
                                    WorkTypeLargeCard(
                                      jobTitle: AppStrings.applyJobWorkTypeJobTitles[index],
                                      requiredDocs: AppStrings.applyJobWorkTypeRequiredDocuments[index],
                                      fillColor: applyJobCubit.workTypeFillColors[index],
                                      borderColor: applyJobCubit.workTypeBorderColors[index],
                                      radioButton: applyJobCubit.workTypeRadioIcon[index],
                                      onTap: () {
                                        applyJobCubit.changeWorkTypeCardColors(index);
                                      },
                                ),
                                separatorBuilder: (context, index) => SizedBox(height: 2.w),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if(applyJobCubit.applyUserModel.interestedWork!.isNotEmpty) {
                        Navigator.pushNamed(context, AppRoutes.applyJobUploadDocsPageRoute);
                      }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
