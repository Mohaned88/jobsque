import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_states.dart';

import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() :super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  Color enabledColor = AppColors.kDarkBlue;

  List<Color> itemColors = List.generate(AppConstants.suggestedJobs.length, (index) => index == 0 ? AppColors.kDarkBlue : AppColors.whiteGrey);

  changeEnabledItemColor(int index){
    itemColors = List.generate(AppConstants.suggestedJobs.length, (index) => AppColors.whiteGrey);
    itemColors[index] = enabledColor;
    emit(EnabledItemColorState());
  }

  getRecentJobList()async{

  }
}