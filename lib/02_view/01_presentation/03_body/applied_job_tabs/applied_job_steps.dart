import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import '../../../../01_model/04_file_model/file_model.dart';
import '../../../../01_model/05_job_model/job_model.dart';
import '../../../../03_controller/01_helper/validation.dart';
import '../../../../03_controller/03_cubit/screens/apply_job/apply_job_States.dart';
import '../../../../03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import '../../../02_components/cards/work_type_large_card.dart';
import '../../../02_components/upload_box.dart';
import '../../../02_components/uploaded_doc_preview.dart';
import '../../../03_widgets/application_steps.dart';
import '../../../03_widgets/custom_elevated_button.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../03_widgets/custom_text_field.dart';
import '../../../04_utilities/res/assets.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class AppliedJobScreen extends StatefulWidget {
  final JobModel? jobModel;
  const AppliedJobScreen({Key? key,this.jobModel}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  PageController pageController = PageController();

  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ApplyJobCubit applyJobCubit = ApplyJobCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
            applyJobCubit.changeStepIndexFunction(pageController.page!.toInt()+1);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.iconsBlack,
          ),
        ),
        centerTitle: true,
        title: const CustomText(
          text: AppStrings.appliedJobScreenTitle,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.jobModel!.image!,
                width: 13.w,
                height: 13.w,
              ),
              SizedBox(height: 3.w),
              CustomText(
                text: widget.jobModel!.name!,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 1.2,
                color: AppColors.kPrimaryBlack,
              ),
              CustomText(
                text: '${widget.jobModel!.company} • ${widget.jobModel!.location}',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.5,
                color: AppColors.kPrimaryBlack,
              ),
            ],
          ),
          BlocConsumer<ApplyJobCubit,ApplyJobStates>(
            listener: (context,state){},
            builder: (context,state)=>Padding(
              padding: EdgeInsets.all(3.w),
              child: ApplicationSteps(
                stepNumber: applyJobCubit.stepIndex,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {},
              children: [
                CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: AppStrings.bioDataStepTitle[0],
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
                                SizedBox(height: 4.w),
                                Row(
                                  children: const [
                                    CustomText(
                                      text: AppStrings.bioDataFullName,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.kPrimaryBlack,
                                    ),
                                    CustomText(
                                      text: '*',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.w),
                                CustomTextField(
                                  borderRadius: 3.w,
                                  enabledBorderColor: AppColors.lightGrey,
                                  focusedBorderColor: AppColors.kPrimaryColor,
                                  prefixIcon: Icons.person_outline_rounded,
                                  prefixIconColor: AppColors.lightGrey,
                                  validator: (value) => nameValidation(value),
                                  controller: nameController,
                                ),
                                SizedBox(height: 5.w),
                                Row(
                                  children: const [
                                    CustomText(
                                      text: AppStrings.email,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.kPrimaryBlack,
                                    ),
                                    CustomText(
                                      text: '*',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.w),
                                CustomTextField(
                                  borderRadius: 3.w,
                                  enabledBorderColor: AppColors.lightGrey,
                                  focusedBorderColor: AppColors.kPrimaryColor,
                                  prefixIcon: Icons.email_outlined,
                                  prefixIconColor: AppColors.lightGrey,
                                  validator: (value) => emailValidation(value),
                                  controller: emailController,
                                ),
                                SizedBox(height: 5.w),
                                Row(
                                  children: const [
                                    CustomText(
                                      text: AppStrings.bioDataPhoneNumber,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.kPrimaryBlack,
                                    ),
                                    CustomText(
                                      text: '*',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: AppColors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.w),
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: AppColors.lightGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                  ),
                                  initialCountryCode: 'US',
                                  controller: phoneController,
                                  dropdownIconPosition: IconPosition.trailing,
                                  flagsButtonPadding:
                                  EdgeInsets.symmetric(horizontal: 3.w),
                                  validator: (p0) =>
                                      phoneNumberValidation(p0.toString()),
                                ),
                                SizedBox(height: 5.w),
                                CustomElevatedButton(
                                  onPressed: () {
                                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                    applyJobCubit.changeStepIndexFunction(pageController.page!.toInt()+2);
                                  },
                                  label: "Next",
                                  width: 88.w,
                                  alignment: Alignment.center,
                                  height: 13.w,
                                  borderRadius: 10.w,
                                  backgroundColor: AppColors.kPrimaryColor,
                                  labelFontSize: 16,
                                  labelFontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 5.w),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
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
                                SizedBox(height: 5.w),
                                BlocConsumer<ApplyJobCubit, ApplyJobStates>(
                                  listener: (BuildContext context, state) {},
                                  builder: (BuildContext context, state) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        AppStrings.applyJobWorkTypeJobTitles.length,
                                            (int index) => Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                WorkTypeLargeCard(
                                          jobTitle:
                                          AppStrings.applyJobWorkTypeJobTitles[index],
                                          requiredDocs: AppStrings
                                                  .applyJobWorkTypeRequiredDocuments[index],
                                          fillColor:
                                          applyJobCubit.workTypeFillColors[index],
                                          borderColor:
                                          applyJobCubit.workTypeBorderColors[index],
                                          radioButton:
                                          applyJobCubit.workTypeRadioIcon[index],
                                          onTap: () {
                                                applyJobCubit.changeWorkTypeCardColors(index);
                                          },
                                        ),
                                                SizedBox(height: 3.w),
                                              ],
                                            ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 5.w),
                                CustomElevatedButton(
                                  onPressed: () {
                                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                    applyJobCubit.changeStepIndexFunction(pageController.page!.toInt()+2);
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
                                SizedBox(height: 5.w),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    BlocConsumer<ApplyJobCubit,ApplyJobStates>(
                      listener: (context,state){},
                      builder: (context,state)=>SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                              child:Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomText(
                                    text: AppStrings.bioDataStepTitle[2],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    height: 1.2,
                                    color: AppColors.kPrimaryBlack,
                                  ),
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  const CustomText(
                                    text: AppStrings.bioDataSubTitle,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: AppColors.grey,
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  Row(
                                    children: const [
                                      CustomText(
                                        text: AppStrings.uploadDocsUploadCV,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: AppColors.kPrimaryBlack,
                                      ),
                                      CustomText(
                                        text: '*',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: AppColors.red,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  if (applyJobCubit.pickedFileCV == null) ...[
                                    UploadBox(
                                      onPressed: () {
                                        applyJobCubit.pickFile(fileName: 'CV');
                                      },
                                      title: AppStrings.uploadDocsUCVBoxTitle,
                                    ),
                                  ],
                                  if (applyJobCubit.pickedFileCV != null) ...[
                                    UploadedDocPreview(
                                      fileModel: FileModel(
                                        name: applyJobCubit.fileCV!.name,
                                        type: applyJobCubit.fileCV!.extension,
                                        photo: AppAssets.pdfLogo,
                                        size: (applyJobCubit.fileCV!.size / 1000)
                                            .toString(),
                                      ),
                                      onPressedEdit: () {
                                        applyJobCubit.pickFile(fileName: 'CV');
                                      },
                                      onPressedDelete: () {
                                        applyJobCubit.clearPickedFile(fileName: 'CV');
                                      },
                                    ),
                                  ],
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  const CustomText(
                                    text: AppStrings.uploadDocsOtherFiles,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    height: 1.3,
                                    color: AppColors.kPrimaryBlack,
                                  ),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  if (applyJobCubit.pickedFileOF == null) ...[
                                    UploadBox(
                                      onPressed: () {
                                        applyJobCubit.pickFile(fileName: 'OF');
                                      },
                                      title: AppStrings.uploadDocsUOFBoxTitle,
                                    ),
                                  ],
                                  if (applyJobCubit.pickedFileOF != null) ...[
                                    UploadedDocPreview(
                                      fileModel: FileModel(
                                        name: applyJobCubit.fileOF!.name,
                                        type: applyJobCubit.fileOF!.extension,
                                        photo: AppAssets.pdfLogo,
                                        size: (applyJobCubit.fileOF!.size / 1000)
                                            .toString(),
                                      ),
                                      onPressedEdit: () {
                                        applyJobCubit.pickFile(fileName: 'OF');
                                      },
                                      onPressedDelete: () {
                                        applyJobCubit.clearPickedFile(fileName: 'OF');
                                      },
                                    ),
                                  ],
                                  SizedBox(height: 5.w),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      applyJobCubit.changeStepIndexFunction(pageController.page!.toInt()+2);
                                    },
                                    label: "Next",
                                    width: 88.w,
                                    alignment: Alignment.center,
                                    height: 13.w,
                                    borderRadius: 10.w,
                                    backgroundColor: AppColors.kPrimaryColor,
                                    labelFontSize: 16,
                                    labelFontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 5.w),
                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
