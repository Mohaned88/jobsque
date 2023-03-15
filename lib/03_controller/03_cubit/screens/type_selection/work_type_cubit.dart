import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';

import '../../../../02_view/04_utilities/res/constants.dart';
import 'work_type_states.dart';

class WorkTypeCubit extends Cubit<WorkTypeStates> {
  WorkTypeCubit() : super(InitialWorkTypeState());

  static WorkTypeCubit get(context) => BlocProvider.of<WorkTypeCubit>(context);

  List<Color> borderColor = List.generate(6, (index) => AppColors.lightGrey);

  List<Color> fillColor = List.generate(6, (index) => AppColors.offWhite);

  List<Color> iconColor = List.generate(6, (index) => AppColors.iconsBlack);

  static const List<String> workTypeTitle = [
    'UI/UX Designer',
    'Illustrator Designer',
    'Developer',
    'Management',
    'Information Technology',
    'Research and Analytics',
  ];

  List<String> selectedWorkTypeTitles = [];



  wtCardColorChange(int index,{required String title}) {
    if (borderColor[index] == AppColors.lightGrey) {
      borderColor[index] = AppColors.kPrimaryColor;
      fillColor[index] = AppColors.kBlue200;
      iconColor[index] = AppColors.kPrimaryColor;
      selectedWorkTypeTitles.add(title);
      emit(SelectedWorkTypeState());
    } else {
      borderColor[index] = AppColors.lightGrey;
      fillColor[index] = AppColors.offWhite;
      iconColor[index] = AppColors.iconsBlack;
      selectedWorkTypeTitles.remove(title);
      emit(UnSelectedWorkTypeState());
    }
  }
}
