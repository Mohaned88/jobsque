import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_states.dart';

import '../../../../../02_view/04_utilities/res/strings.dart';

class FilterBSCubit extends Cubit<FilterBSStates> {
  FilterBSCubit() : super(InitialFilterBSState());

  static FilterBSCubit get(BuildContext context) =>
      BlocProvider.of<FilterBSCubit>(context);

  List<Color> fillColor = List<Color>.generate(
    AppStrings.searchFilterJobTypes.length,
    (index) => AppColors.white,
  );
  List<Color> borderColor = List<Color>.generate(
    AppStrings.searchFilterJobTypes.length,
        (index) => AppColors.lightGrey,
  );
  List<Color> labelColor = List<Color>.generate(
    AppStrings.searchFilterJobTypes.length,
        (index) => AppColors.grey,
  );

  changeJobTypeCardColor(int index){
    if(fillColor[index] == AppColors.white){
      fillColor[index] = AppColors.kBlue200;
      borderColor[index] = AppColors.kPrimaryColor;
      labelColor[index] = AppColors.kPrimaryColor;
      emit(SelectedJobTypeState());
    }
    else{
      fillColor[index] = AppColors.white;
      borderColor[index] = AppColors.lightGrey;
      labelColor[index] = AppColors.midLightGrey;
      emit(UnSelectedJobTypeState());
    }
  }
//////////////////////////////////////////////
  List<Color> remoteFillColor = List<Color>.generate(
    4,
        (index) => AppColors.white,
  );
  List<Color> remoteBorderNLabelColor = List<Color>.generate(
    4,
        (index) => AppColors.midLightGrey,
  );
  List<String> remoteSelectedTitles = ['Remote'];
//////////////////////////////////////////////
  List<Color> fulltimeFillColor = List<Color>.generate(
    4,
        (index) => AppColors.white,
  );
  List<Color> fulltimeBorderNLabelColor = List<Color>.generate(
    4,
        (index) => AppColors.midLightGrey,
  );
  List<String> fulltimeSelectedTitles = ['Full Time'];
//////////////////////////////////////////////
  List<Color> postdateFillColor = List<Color>.generate(
    4,
        (index) => AppColors.white,
  );
  List<Color> postdateBorderNLabelColor = List<Color>.generate(
    4,
        (index) => AppColors.midLightGrey,
  );
  List<String> postdateSelectedTitles = ['Post Date'];
//////////////////////////////////////////////
  List<Color> expFillColor = List<Color>.generate(
    4,
        (index) => AppColors.white,
  );
  List<Color> expBorderNLabelColor = List<Color>.generate(
    4,
        (index) => AppColors.midLightGrey,
  );
  List<String> expSelectedTitles = ['Experience Level'];
//////////////////////////////////////////////
  changeTypeFiltersJobTypeCardColor(int index,String type){
    if(type == 'Remote'){
      if(remoteFillColor[index] == AppColors.white){
        remoteFillColor[index] = AppColors.kBlue200;
        remoteBorderNLabelColor[index] = AppColors.kPrimaryColor;
        if(!remoteSelectedTitles.contains(AppStrings.inSideFiltersTypesNames[type]![index])){
          remoteSelectedTitles.add(AppStrings.inSideFiltersTypesNames[type]![index]);
        }
        emit(SelectedJobTypeState());
      }
      else{
        remoteFillColor[index] = AppColors.white;
        remoteBorderNLabelColor[index] = AppColors.midLightGrey;

          remoteSelectedTitles.remove(AppStrings.inSideFiltersTypesNames[type]![index]);

        emit(UnSelectedJobTypeState());
      }
    }
    else if(type == 'Full Time'){
      if(fulltimeFillColor[index] == AppColors.white){
        fulltimeFillColor[index] = AppColors.kBlue200;
        fulltimeBorderNLabelColor[index] = AppColors.kPrimaryColor;
        if(!fulltimeSelectedTitles.contains(AppStrings.inSideFiltersTypesNames[type]![index])) {
          fulltimeSelectedTitles.add(
              AppStrings.inSideFiltersTypesNames[type]![index]);
        }
        emit(SelectedJobTypeState());
      }
      else{
        fulltimeFillColor[index] = AppColors.white;
        fulltimeBorderNLabelColor[index] = AppColors.midLightGrey;

          fulltimeSelectedTitles.remove(
              AppStrings.inSideFiltersTypesNames[type]![index]);

        emit(UnSelectedJobTypeState());
      }
    }
    else if(type == 'Post Date'){
      if(postdateFillColor[index] == AppColors.white){
        postdateFillColor[index] = AppColors.kBlue200;
        postdateBorderNLabelColor[index] = AppColors.kPrimaryColor;
        if(!postdateSelectedTitles.contains(AppStrings.inSideFiltersTypesNames[type]![index])) {
          postdateSelectedTitles.add(
              AppStrings.inSideFiltersTypesNames[type]![index]);
        }
        emit(SelectedJobTypeState());
      }
      else{
        postdateFillColor[index] = AppColors.white;
        postdateBorderNLabelColor[index] = AppColors.midLightGrey;

          postdateSelectedTitles.remove(
              AppStrings.inSideFiltersTypesNames[type]![index]);

        emit(UnSelectedJobTypeState());
      }
    }
    else if(type == 'Experience Level'){
      if(expFillColor[index] == AppColors.white){
        expFillColor[index] = AppColors.kBlue200;
        expBorderNLabelColor[index] = AppColors.kPrimaryColor;
        if(!expSelectedTitles.contains(AppStrings.inSideFiltersTypesNames[type]![index])) {
          expSelectedTitles.add(
              AppStrings.inSideFiltersTypesNames[type]![index]);
        }
        emit(SelectedJobTypeState());
      }
      else{
        expFillColor[index] = AppColors.white;
        expBorderNLabelColor[index] = AppColors.midLightGrey;
          expSelectedTitles.remove(AppStrings.inSideFiltersTypesNames[type]![index]);

        emit(UnSelectedJobTypeState());
      }
    }


  }

}
