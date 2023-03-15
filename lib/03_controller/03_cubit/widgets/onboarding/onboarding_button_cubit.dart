
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../02_view/04_utilities/res/strings.dart';
import 'onboarding_button_states.dart';

class OnBoardingButtonCubit extends Cubit<OnBoardingButtonStates>{

  OnBoardingButtonCubit() :super(InitialOnBoardBState());

  static OnBoardingButtonCubit get(context) => BlocProvider.of<OnBoardingButtonCubit>(context);

  String buttonText = AppStrings.onBoardingNext;
  int pageIndex = 0;

  changeButtonText(int index){
    if(index == 2){
      buttonText = AppStrings.onBoardingGetStarted;
      emit(ButtonGetStartedState());
    }
    else{
      buttonText = AppStrings.onBoardingNext;
      emit(ButtonNextState());
    }
  }

}