import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved_cubit/saved_states.dart';

import '../../../../01_model/05_job_model/job_model.dart';

class SavedCubit extends Cubit<SavedStates>{

  SavedCubit():super(InitialSavedState());

  static SavedCubit get(BuildContext context)=> BlocProvider.of(context);

  List<JobModel> savedJobs =[];

  removeFromSavedJobs({JobModel? jobModel}){
    savedJobs.remove(jobModel);
    emit(RemoveFromSavedState());
  }
  addToSavedJobs({JobModel? jobModel}){
    savedJobs.add(jobModel!);
    emit(AddToSavedState());
  }
}