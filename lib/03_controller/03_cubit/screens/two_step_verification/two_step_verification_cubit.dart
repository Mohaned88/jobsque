import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/03_controller/03_cubit/screens/two_step_verification/two_step_verification_states.dart';

import '../../../../02_view/04_utilities/res/strings.dart';

class TwoStepVerificationCubit extends Cubit<TwoStepVerificationStates>{
  TwoStepVerificationCubit():super(InitialTwoStepVerificationState());

  static TwoStepVerificationCubit get(BuildContext context) => BlocProvider.of<TwoStepVerificationCubit>(context);

  bool isActive = false;

  activateOrDeActivate2StepVerification({required bool value}){
    isActive = value;
    emit(ChangeActivationState());
  }

  String method = AppStrings.twoStepVerificationMethods[1];

  selectVerificationMethod({required String methodName}){
    method = methodName;
    emit(ChangeSelectedMethodState());
  }
}