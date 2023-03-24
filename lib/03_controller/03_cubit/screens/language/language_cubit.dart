import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/language/language_states.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(InitialLanguageState());

  static LanguageCubit get(BuildContext context) => BlocProvider.of<LanguageCubit>(context);

  List<Color> iconColors = List.generate(AppStrings.languages.length,
      (index) => index == 0 ? AppColors.kPrimaryColor : AppColors.lightGrey);
  List<IconData> iconType = List.generate(AppStrings.languages.length,
          (index) => index == 0 ? Icons.radio_button_checked_outlined : Icons.radio_button_off_outlined);

  changeIconColor(selectedIndex,{required String token,required int userID}) {
    iconColors = List.generate(AppStrings.languages.length, (index) => AppColors.lightGrey);
    iconType = List.generate(AppStrings.languages.length, (index) => Icons.radio_button_off_outlined);
    iconColors[selectedIndex] = AppColors.kPrimaryColor;
    iconType[selectedIndex] = Icons.radio_button_checked_outlined;
    editProfileLanguageAPI(userID: userID, index: selectedIndex, token: token);
    emit(SelectedLanguageState());
  }

  editProfileLanguageAPI(
      {required int userID,
      required int index,
      required String token}) async {
    try {
      Uri url = Uri.parse(
          'http://${AppConstants.editProfileLanguageLink}$userID?language=${AppStrings.languages[index]}');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().put(
        '$url',
        options: Options(
          headers: headers,
        ),
      );

      if(response.statusCode == 200){
        print(response.data);
        emit(UpdatedProfileLanguageSuccessState());
      }
      else{}
      //print(response.data);
      emit(UpdatedProfileLanguageSuccessState());
    } catch (e) {
      print("update language failed with error =========================>>>>>>>>>> $e");
    }
  }
}
