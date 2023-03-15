import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_States.dart';

import '../../../../02_view/04_utilities/res/assets.dart';
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
}
