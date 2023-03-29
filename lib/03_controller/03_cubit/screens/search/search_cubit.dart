import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/05_job_model/job_model.dart';
import 'package:jobsque/03_controller/03_cubit/screens/search/search_states.dart';

import '../../../../02_view/04_utilities/res/constants.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(InitialSearchState());

  static SearchCubit get(BuildContext context) => BlocProvider.of<SearchCubit>(context);

  List<JobModel> searchResultList = [];

  getSuggestJobList({required String token,required String searchText}) async {
    searchResultList = [];
    emit(LoadingSearchJobsListState());
    try {
      Uri url = Uri.parse('http://${AppConstants.searchJobsLink}$searchText');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      //print(headers);
      var response = await Dio().get(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        response.data['data'].forEach(
              (element) {
            searchResultList.add(
              JobModel.fromMap(element),
            );
          },
        );
        emit(RetrieveSearchListSuccessState());
      } else {
        emit(RetrieveSearchListFailState());
      }
    } catch (e) {
      print(
          "Search List failed with error =========================>>>>>>>>>> $e");
    }
  }
}