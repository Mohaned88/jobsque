import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/account/button/account_button_states.dart';

import '../../../../../02_view/05_styles/colors.dart';
import '../../../auth/auth_cubit.dart';

class AccButtonCubit extends Cubit<AccButtonStates>{

  AccButtonCubit() :super(InitialButtonState());

  static AccButtonCubit get(context) => BlocProvider.of<AccButtonCubit>(context);

  Color labelColor = AppColors.white;
  Color backgroundColor = AppColors.kPrimaryColor;



  signupOnPressed({String? name, String? email, String? pass, GlobalKey<FormState>? formKey, BuildContext? context}) {
    AuthCubit authCubit = AuthCubit.get(context!);
    if (name!.isEmpty &&
        (email!.isEmpty &&
        pass!.isEmpty)) {
      labelColor = AppColors.grey;
      backgroundColor = AppColors.midLightGrey;
      emit(SignupDisabledState());
      return null;
    } else {
      labelColor = AppColors.white;
      backgroundColor = AppColors.kPrimaryColor;
      return (){
        if (formKey!.currentState!.validate()) {
          authCubit.register(password: pass!, mail: email!, name: name);
          emit(SignupEnabledState());

        }
      };
    }
  }

  loginOnPressed({String? email, String? pass, GlobalKey<FormState>? formKey, VoidCallback? onPressed}) {
    if (email!.isEmpty && pass!.isEmpty) {
      labelColor = AppColors.grey;
      backgroundColor = AppColors.midLightGrey;
      emit(LoginDisabledState());
      return null;
    } else {
      labelColor = AppColors.white;
      backgroundColor = AppColors.kPrimaryColor;
      emit(LoginEnabledState());
      return onPressed;
    }
  }


}