import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/01_home.dart';
import 'package:jobsque/02_view/01_presentation/03_body/04_saved.dart';
import 'package:jobsque/02_view/01_presentation/03_body/05_message.dart';
import 'package:jobsque/02_view/01_presentation/03_body/06_profile.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/01_apply_job_main.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/bottom_nav_bar/bottom_nav_bar_states.dart';

import '../../../../../02_view/01_presentation/03_body/applied_job_steps.dart';

class BottomBarCubit extends Cubit<BottomBarStates>{

  BottomBarCubit():super(InitialBottomBarState());

  static BottomBarCubit get(context) => BlocProvider.of<BottomBarCubit>(context);

  int currentIndex = 0;

  List<Widget> bodyScreens = [
    const HomeScreen(),
    const MessageScreen(),
    AppliedJobScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];

  Widget? bodySc = HomeScreen();

  changeIndex(int index){
    currentIndex = index;
    bodySc = bodyScreens[index];
    emit(BodyMainScreenState());
  }

}
