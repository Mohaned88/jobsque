import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../02_view/05_styles/colors.dart';
import 'text_field_states.dart';

class TextFieldCubit extends Cubit<TextFieldStates> {
  TextFieldCubit() : super(InitialTextFieldStates());

  static TextFieldCubit get(context) => BlocProvider.of<TextFieldCubit>(context);

  bool obscure = false;
  IconData passSuffixIcon = Icons.visibility;
  Color borderColor = AppColors.kPrimaryColor;
  Color passCheckTextColor = AppColors.midLightGrey;

  List<bool> cpFieldsObscure = List.generate(3, (index) => false);
  List<IconData> cpSuffixIcons = List.generate(3, (index) => Icons.visibility);

  visibilityChange() {
      if (obscure == false) {
        obscure = true;
        passSuffixIcon = Icons.visibility_off;
        emit(ObscureTextState());
      } else {
        obscure = false;
        passSuffixIcon = Icons.visibility;
        emit(VisibleTextState());
      }
  }

  borderColorChange(String text){
    if(text.isEmpty){
      borderColor = AppColors.kPrimaryColor;
      passCheckTextColor = AppColors.midLightGrey;
      emit(EmptyPasswordState());
    }
    else if(text.isNotEmpty && text.length < 8){
      borderColor = AppColors.red;
      passCheckTextColor = AppColors.red;
      emit(BadPasswordState());
    }
    else{
      borderColor = AppColors.green;
      passCheckTextColor = AppColors.green;
      emit(GoodPasswordState());
    }
  }

  changePasswordVisibilityChange(int index) {
    if (cpFieldsObscure[index] == false) {
      cpFieldsObscure[index] = true;
      cpSuffixIcons[index] = Icons.visibility_off;
      emit(ListItemObscureTextState());
    } else {
      cpFieldsObscure[index] =  false;
      cpSuffixIcons[index] = Icons.visibility;
      emit(ListItemVisibleTextState());
    }
  }

}
