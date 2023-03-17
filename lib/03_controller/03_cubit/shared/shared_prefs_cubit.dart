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

  setUserDataInPrefs({UserModel? userModel})async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', userModel!.email!);
    prefs.setString('name', userModel.name!);
    prefs.setString('photo', userModel.photo!);
    prefs.setString('id', userModel.id.toString());
    emit(SetUserDataInPrefs());
  }

  getUserDataInPrefs()async{
    final SharedPreferences prefs = await _prefs;
   /* var response = await firebaseFirestore.collection('users').doc(prefs.getString('id')).get();
    //print('-----------------------------------------${response.data()}');
    userModel = UserModel.fromMap(response.data());*/
    emit(GetUserDataInPrefs());
  }

  getFromSharedPrefs()async{
    final SharedPreferences prefs = await _prefs;
    isLoggedIn = prefs.getBool('loggedIn');
    isFirstTime = prefs.getBool('isFirstTime');
    emit(SetIsLoggedInValueState());
    if(prefs.getBool('loggedIn')! == true){
      emit(LoggedInState());
    }
    else {
      emit(SignedOutState());
    }
    if(prefs.getBool('isFirstTime')! == false){
      emit(NotFirstTimeState());
    }
    else {
      emit(FirstTimeState());
    }
  }
}