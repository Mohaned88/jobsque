import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/00_user_model/user_model.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_States.dart';

import '../../../../01_model/05_job_model/job_model.dart';
import '../../../../02_view/04_utilities/res/assets.dart';
import '../../../../02_view/04_utilities/res/constants.dart';
import '../../../../02_view/04_utilities/res/strings.dart';

class ApplyJobCubit extends Cubit<ApplyJobStates> {
  ApplyJobCubit() : super(InitialApplyJobState());

  static ApplyJobCubit get(context) => BlocProvider.of<ApplyJobCubit>(context);

  String jobType = AppStrings.applyJobPeopleFilterItems.first;

  changeJobTypeThroughFilter({required String selectedType}) {
    jobType = selectedType;
    emit(SelectJobState());
  }

  String initialSaveIcon = AppAssets.bottomBarIcon[3];

  changeSaveIcon() {
    if (initialSaveIcon == AppAssets.bottomBarIcon[3]) {
      initialSaveIcon = AppAssets.bottomBarActiveIcon[3];
      emit(SavedToSavedJobsState());
    } else {
      initialSaveIcon = AppAssets.bottomBarIcon[3];
      emit(RemovedFromSavedJobsState());
    }
  }

  List<Color> workTypeBorderColors = List.generate(
      AppStrings.applyJobWorkTypeJobTitles.length,
      (index) => AppColors.lightGrey);
  List<Color> workTypeFillColors = List.generate(
      AppStrings.applyJobWorkTypeJobTitles.length,
      (index) => Colors.transparent);
  List<IconData> workTypeRadioIcon = List.generate(
      AppStrings.applyJobWorkTypeJobTitles.length,
      (index) => Icons.radio_button_off_outlined);

  changeWorkTypeCardColors(int index) {
    workTypeBorderColors = List.generate(
        AppStrings.applyJobWorkTypeJobTitles.length,
            (index) => AppColors.lightGrey);
    workTypeFillColors = List.generate(
        AppStrings.applyJobWorkTypeJobTitles.length,
            (index) => Colors.transparent);
    workTypeRadioIcon = List.generate(
        AppStrings.applyJobWorkTypeJobTitles.length,
            (index) => Icons.radio_button_off_outlined);
    workTypeBorderColors[index] =
        workTypeBorderColors[index] == AppColors.kPrimaryColor
            ? AppColors.lightGrey
            : AppColors.kPrimaryColor;
    workTypeRadioIcon[index] =
        workTypeBorderColors[index] == AppColors.lightGrey
            ? Icons.radio_button_off_outlined
            : Icons.radio_button_checked_outlined;
    workTypeFillColors[index] = workTypeFillColors[index] == Colors.transparent
        ? AppColors.kBlue200
        : Colors.transparent;
    if(!applyUserModel.interestedWork!.contains(AppStrings.applyJobWorkTypeJobTitles[index])) {
      applyUserModel.interestedWork!.add(AppStrings.applyJobWorkTypeJobTitles[index]);
    }
    else{
      applyUserModel.interestedWork!.remove(AppStrings.applyJobWorkTypeJobTitles[index]);
    }
    emit(ChangeWorkTypeCardColorsState());
  }

  FilePicker? picker = FilePicker.platform;
  FilePickerResult? result;
  PlatformFile? fileCV;
  String? fileToDisplayCV;
  File? pickedFileCV;

  PlatformFile? fileOF;
  String? fileToDisplayOF;
  File? pickedFileOF;

  pickFile({String? fileName}) async {
    if (fileName == 'CV') {
      try {
        result = await picker!.pickFiles(
          type: FileType.any,
          allowMultiple: false,
        );
        emit(PickedFileFromStorageState());
        if (result != null) {
          fileCV = result!.files.first;
          pickedFileCV = File(fileToDisplayCV.toString());
          fileToDisplayCV = fileCV!.path;
          emit(ChangeToUploadedPreviewBoxState());
        }
      } catch (e) {
        print(
            '=======================>>>>>>>>>> This is your CV error :::: $e');
      }
    } else {
      try {
        result = await picker!.pickFiles(
          type: FileType.any,
          allowMultiple: false,
        );
        emit(PickedFileFromStorageState());
        if (result != null) {
          fileOF = result!.files.first;
          pickedFileOF = File(fileToDisplayCV.toString());
          fileToDisplayOF = fileCV!.path;
          emit(ChangeToUploadedPreviewBoxState());
        }
      } catch (e) {
        print(
            '=======================>>>>>>>>>> This is your OtherFile error :::: $e');
      }
    }
  }

  clearPickedFile({String? fileName}) {
    if (fileName == 'CV') {
      fileCV = null;
      pickedFileCV = null;
      fileToDisplayCV = null;
      emit(ChangeToUploadBoxState());
    } else {
      fileOF = null;
      pickedFileOF = null;
      fileToDisplayOF = null;
      emit(ChangeToUploadBoxState());
    }
  }

  int stepIndex = 0;

  changeStepIndexFunction(int index){
    stepIndex = index;
    emit(ChangeStepIndexState());
  }

  List<JobModel> appliedActiveJobs = [
    JobModel(
      image: AppAssets.twitterLogo,
      location: 'مصر',
      name: 'مهندس',
      id: 1,
      favorites: 0,
      expired: 0,
      description: 'أى حاجه',
      companyWebSite: 'google.com',
      companyMail: 'mohanedabdallah88@gmail.com',
      aboutCompany: 'some info',
      skills: 'bye3raf yedayya3 2l wa2t',
      company: 'baklawez',
      types: ['senior','full time','on site'],
      salary: '15k-20k',
      createdAt: '2023-03-12T14:01:03.000000Z',
    ),
    JobModel(
      image: AppAssets.twitterLogo,
      location: '2مصر',
      name: '2مهندس',
      id: 2,
      favorites: 0,
      expired: 0,
      description: 'أى حاجه',
      companyWebSite: 'google.com',
      companyMail: 'mohanedabdallah88@gmail.com',
      aboutCompany: 'some info',
      skills: 'bye3raf yedayya3 2l wa2t',
      company: 'baklawez',
      types: ['senior','full time','on site'],
      salary: '15k-20k',
      createdAt: '2023-03-12T14:01:03.000000Z',
    ),
  ];
  List<JobModel> appliedRejectedJobs = [];

  UserModel applyUserModel = UserModel();
  late int selectedJobId;

  applyJobAPI({required String token, required int userID,required int jobID,})async{

    try {
      Uri url =
      Uri.parse('http://134.209.132.80/api/apply?');
      var headers = {
        'Authorization': 'Bearer $token',
        'Connection' : 'keep-alive',
        'Accept-Encoding' : 'gzip, deflate, br',
        'Keep-Alive' : 'timeout=5, max=100',
      };
      var body ={
        'mobile' : applyUserModel.mobile,
        'work_type' : applyUserModel.interestedWork,
        'cv_file' : jsonEncode(fileToDisplayCV),
        'other_file': jsonEncode(fileToDisplayOF),
        'job_id' : jobID,
        'user_id': userID,
      };
      var response = await Dio().post(
        '$url',
        data: body,
        options: Options(
          headers: headers,

        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        emit(AppliedToJobSuccessState());
      } else {
        emit(AppliedToJobFailState());
      }
    } catch (e) {
      print(
          "Applying for Job $jobID failed with error =========================>>>>>>>>>> $e");
    }
  }


}
