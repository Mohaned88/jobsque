import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/location_selection/preferred_location_states.dart';

class PrefLocationCubit extends Cubit<PrefLocationStates>{
  PrefLocationCubit():super(InitialPrefLocState());

  static PrefLocationCubit get(context) => BlocProvider.of<PrefLocationCubit>(context);

  List<Color> offlineBorderColor = List.generate(13, (index) => AppColors.lightGrey);
  List<Color> offlineFillColor = List.generate(13, (index) => AppColors.offWhite);
  List<Color> onlineBorderColor = List.generate(13, (index) => AppColors.lightGrey);
  List<Color> onlineFillColor = List.generate(13, (index) => AppColors.offWhite);

  List<String> offlineLocations =[];
  List<String> remoteLocations =[];

  countryCardColorChange(int index, {required String location, required String countryName}){
    if(location == 'offline') {
      if (offlineBorderColor[index] == AppColors.lightGrey) {
        offlineBorderColor[index] = AppColors.kPrimaryColor;
        offlineFillColor[index] = AppColors.kBlue200;
        offlineLocations.add(countryName);
        emit(SelectedCountryState());
      } else {
        offlineBorderColor[index] = AppColors.lightGrey;
        offlineFillColor[index] = AppColors.offWhite;
        offlineLocations.remove(countryName);
        emit(UnSelectedCountryState());
      }
    }
    else{
      if (onlineBorderColor[index] == AppColors.lightGrey) {
        onlineBorderColor[index] = AppColors.kPrimaryColor;
        onlineFillColor[index] = AppColors.kBlue200;
        remoteLocations.add(countryName);
        emit(SelectedCountryState());
      } else {
        onlineBorderColor[index] = AppColors.lightGrey;
        onlineFillColor[index] = AppColors.offWhite;
        remoteLocations.remove(countryName);
        emit(UnSelectedCountryState());
      }
    }
  }

}