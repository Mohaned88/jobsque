import '../../02_view/04_utilities/res/strings.dart';

String? nameValidation(String value) {
  if(value.isEmpty){
    return AppStrings.emptyName;
  }
  else if (value.length < 3) {
    return AppStrings.shortName;
  }
  else if (!RegExp(AppStrings.nameRegExp).hasMatch(value)) {
    return AppStrings.validEmail;
  }
  return null;
}

String? passwordValidation(String value) {
  if (value.length < 8) {
    return AppStrings.shortPassword;
  }
  return null;
}

String? confirmPassValidation(String value,String pass) {
  if (value != pass) {
    return AppStrings.mustEqualPassword;
  }
  return null;
}

String? emailValidation(value) {
  if (value.length == 0) {
    return AppStrings.emailEmpty;
  }
  else if (!RegExp(AppStrings.emailRegExp).hasMatch(value)) {
    return AppStrings.validEmail;
  }
    return null;
}

String? phoneNumberValidation(String value) {
  if (value.isEmpty) {
    return AppStrings.phoneNumberEmpty;
  }
  else if(value.length < 11){
    return AppStrings.shortPhoneNumber;
  }
  else if (!RegExp(AppStrings.phoneNumberRegExp).hasMatch(value)) {
    return AppStrings.validPhoneNumber;
  }
  return null;
}