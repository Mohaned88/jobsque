import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_cubit.dart';

import '../../../../01_model/05_job_model/job_model.dart';
import '../../../../02_view/04_utilities/res/constants.dart';
import 'saved_states.dart';

class SavedCubit extends Cubit<SavedStates> {
  SavedCubit() : super(InitialSavedState());

  static SavedCubit get(BuildContext context) => BlocProvider.of(context);

  List<JobModel> savedJobs = [];

  removeFromSavedJobs({JobModel? jobModel}) {
    savedJobs.remove(jobModel);
    emit(RemoveFromSavedState());
  }

  addToSavedJobs({JobModel? jobModel}) {
    savedJobs.add(jobModel!);
    emit(AddToSavedState());
  }

  addToFavoritesInAPI(
      {required String token, required int userID, required int jobID}) async {
    try {
      showAllFavoritesFromAPI(
        token: token,
        userID: userID,
      );
      Uri url = Uri.parse(
          'http://${AppConstants.addToFavoritesLink}user_id=$userID&job_id=$jobID');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().post(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        emit(AddToFavoriteSuccessState());
      } else {
        emit(AddToFavoriteSFailState());
      }
    } catch (e) {
      print(
          "Adding To Favorite failed with error =========================>>>>>>>>>> $e");
    }
  }

  showAllFavoritesFromAPI(
      {required String token,
      required int userID,
      BuildContext? context}) async {
    savedJobs = [];
    try {
      Uri url =
          Uri.parse('http://${AppConstants.showFavoritesFromAPILink}$userID');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().get(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        //print(response.data['data'].length);
        /*for(int j = 0; j < response.data['data'].length; j++){
          var searchList = HomeCubit.get(context).recentJobs;
          for(int i = 0; i < searchList.length; i++){
            if(searchList[i].id == response.data['data'][j]['job_id']){
              savedJobs.add(searchList[i]);
              HomeCubit.get(context).recentJobsSaveIcons[i] = AppAssets.bottomBarActiveIcon[3];
            }
          }
        }*/
        response.data['data'].forEach(
          (element) {
            savedJobs.add(
              JobModel(
                id: element['id'],
                jobId: element['job_id'],
                name: element['name'],
                location: element['location'],
                image: element['image'],
                createdAt: element['created_at'],
                favorites: element['like'],
              ),
            );
          },
        );
      //  print(response.data['data']);
        emit(GetFavoriteListSuccessState());
      } else {
        emit(GetFavoriteListFailState());
      }
    } catch (e) {
      print(
          "Getting Favorite List failed with error =========================>>>>>>>>>> $e");
    }
  }

  deleteFavoriteFromAPIList({required String token, required int jobID}) async {
    try {
      Uri url =
          Uri.parse('http://${AppConstants.showFavoritesFromAPILink}$jobID');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().deleteUri(
        url,
        options: Options(
          headers: headers,
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        emit(AddToFavoriteSuccessState());
      } else {
        emit(AddToFavoriteSFailState());
      }
    } catch (e) {
      print(
          "Deleting Favorite failed with error =========================>>>>>>>>>> $e");
    }
  }
}
