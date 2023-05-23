import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/00_user_model/user_model.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_states.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialAuthStates());

  static AuthCubit get(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context);

  static String authorizationToken = "";

  UserModel userModel = UserModel();

  login({required String password, required String mail}) async {
    try {
      Uri url = Uri.parse(
          'http://${AppConstants.loginLink}password=$password&email=$mail');
      http.Response response = await http.post(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        authorizationToken = data['token'];
        print('success \n token = $authorizationToken');
        //print(password);
        userModel.id =data['user']['id'];
        userModel.name =data['user']['name'];
        userModel.email =data['user']['email'];
        userModel.password =password;
        print(userModel.name);
        emit(LoginSuccessfullyState());
      } else {
        print('failed');
        emit(LoginFailedState());
        throw Exception(data['message']);
      }
    }
    catch (e) {
      print("login failed with error =========================>>>>>>>>>> $e");
      throw Exception('failed to get response error => $e');
    }
  }

  register(
      {required String password, required String mail, required String name}) async {
    try {
      Uri url = Uri.parse('http://${AppConstants
          .registerLink}name=$name&email=$mail&password=$password');
      http.Response response = await http.post(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        authorizationToken = data['token'];
        print('success \n token = $authorizationToken');
        userModel.id =data['data']['id'];
        userModel.name =data['data']['name'];
        userModel.email =data['data']['email'];
        userModel.password =password;
        print(userModel.name);
        emit(RegisterSuccessfullyState());
      } else {
        print('failed');
        emit(RegisterFailedState());
        throw Exception(data['message']);
      }
    }
    catch (e) {
      print("login failed with error =========================>>>>>>>>>> $e");
      throw Exception('failed to get response error => $e');
    }
  }

  putSelectedWorkType({
    List? offlinePlace,
    List? onlinePlace,
    List? workType,
    int? userId,
  }) async {
    try {
      Uri url = Uri.parse('http://${AppConstants.workTypeLink}$userId?');
      var headers = {
        'Authorization': 'Bearer ${AuthCubit.authorizationToken}',
      };
      var response = await Dio().put(
        '$url',
        data: {
          'intersted_work': workType,
          'remote_place': onlinePlace,
          'offline_place': offlinePlace,
        },
        //headers: headers,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        emit(CollectedDataSuccessState());
      } else {
        emit(CollectedDataFailState());
      }
    } catch (e) {
      print(
          "Work selection failed with error =========================>>>>>>>>>> $e");
    }
  }

}
