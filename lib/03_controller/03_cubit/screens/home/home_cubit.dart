import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/05_job_model/job_model.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_states.dart';

import 'package:dio/dio.dart';

import '../../../../02_view/04_utilities/res/assets.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() :super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  Color enabledColor = AppColors.kDarkBlue;

  List<Color> itemColors = List.generate(AppConstants.suggestedJobs.length, (index) => index == 0 ? AppColors.kDarkBlue : AppColors.whiteGrey);

  changeEnabledItemColor(int index){
    itemColors = List.generate(AppConstants.suggestedJobs.length, (index) => AppColors.whiteGrey);
    itemColors[index] = enabledColor;
    emit(EnabledItemColorState());
  }

  List<JobModel> recentJobs =[];

  getRecentJobList({required String token})async{
    emit(LoadingJobsListState());
    try {
      Uri url = Uri.parse('http://${AppConstants.jobsLink}');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      print(headers);
      var response = await Dio().get(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      print(response.statusCode);
      print(response.data['data']);
      if (response.statusCode == 200) {
        response.data['data'].forEach((element){
          recentJobs.add(
              JobModel(
            id: element['id'],
            name: element['name'],
            image: element['image'] ?? AppAssets.twitterLogo,
            types: [element['job_time_type'],element['job_type'],element['job_level']],
            description: element['job_description'],
            skills: element['job_skill'],
            company: element['comp_name'],
            companyMail: element['comp_email'],
            companyWebSite: element['comp_website'],
            aboutCompany: element['about_comp'],
            location: element['location'],
            salary: element['salary'],
            expired: element['expired'],
            favorites: element['favorites'],
          )
          );
        });
        print(response.data['data'][1]);
        emit(RetrieveListSuccessState());
      } else {
        emit(RetrieveListFailState());
      }
    } catch (e) {
      print(
          "Retrieve List failed with error =========================>>>>>>>>>> $e");
    }
  }
}