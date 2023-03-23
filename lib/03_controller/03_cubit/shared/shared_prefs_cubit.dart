import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../01_model/00_user_model/user_model.dart';
import 'shared_prefs_states.dart';

class SharedPCubit extends Cubit<SharedPStates>{

  SharedPCubit(): super(InitialSharedPState());

  static SharedPCubit get(context) => BlocProvider.of<SharedPCubit>(context);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool? isLoggedIn = false;


  UserModel? userModel;

  storeLoggedInSharedPrefs(bool? value) async{
    final SharedPreferences prefs = await _prefs;
    if(value == true){
      prefs.setBool('loggedIn', true);
      isLoggedIn = true;
      emit(SetIsLoggedInValueTrueState());
    }else {
      prefs.setBool('loggedIn', false);
      isLoggedIn = false;
      emit(SetIsLoggedInValueFalseState());
    }
  }

  bool? isFirstTime = true;

  storeFirstTimeInSharedPrefs() async{
    final SharedPreferences prefs = await _prefs;
    if(isFirstTime == true){
      prefs.setBool('isFirstTime', false);
      isLoggedIn = false;
      emit(SetIsFirstTimeValueFalseState());
    }
  }

  String token = '';

  storeAuthTokenInSharedPrefs(String token) async{
    final SharedPreferences prefs = await _prefs;
      prefs.setString('token', token);
      emit(SetTokenInSharedPrefsState());
  }

  getAuthTokenInSharedPrefs() async{
    final SharedPreferences prefs = await _prefs;
    token = prefs.getString('token')!;
    emit(GetTokenFromSharedPrefsState());
    return prefs.getString('token')!;
  }

  setUserDataInPrefs({UserModel? userModel})async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', userModel!.email!);
    prefs.setString('name', userModel.name!);
    //prefs.setString('photo', userModel.photo!);
    prefs.setString('id', userModel.id.toString());
    emit(SetUserDataInPrefs());
  }

  getUserDataInPrefs()async{
    final SharedPreferences prefs = await _prefs;
    userModel!.name = prefs.getString('name');
    userModel!.email = prefs.getString('email');
    //userModel.id = int.parse(prefs.getString('id').toString());
    emit(GetUserDataInPrefs());
  }

  getFromSharedPrefs()async{
    final SharedPreferences prefs = await _prefs;
    emit(SetIsLoggedInValueState());
    if(prefs.getBool('loggedIn') == true){
      isLoggedIn = prefs.getBool('loggedIn');
      emit(LoggedInState());
    }
    else {
      isLoggedIn = false;
      emit(SignedOutState());
    }
    if(prefs.getBool('isFirstTime') == false){
      isFirstTime = prefs.getBool('isFirstTime');
      emit(NotFirstTimeState());
    }
    else {
      isFirstTime = true;
      emit(FirstTimeState());
    }
  }
}