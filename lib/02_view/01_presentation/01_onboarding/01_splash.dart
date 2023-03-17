import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_states.dart';

import '../../../03_controller/00_navigation/routes.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPCubit sharedPCubit = SharedPCubit.get(context);
    sharedPCubit.getFromSharedPrefs();
    //sharedPCubit.getAuthTokenInSharedPrefs();
    HomeCubit homeCubit = HomeCubit.get(context);
    if((sharedPCubit.isFirstTime == false) && (sharedPCubit.isLoggedIn == true)){
      print(sharedPCubit.token);
      homeCubit.getRecentJobList(token: AuthCubit.authorizationToken);
    }

    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(
        context,
        sharedPCubit.isFirstTime == true? AppRoutes.onBoardingRoute : sharedPCubit.isLoggedIn == true? AppRoutes.bodyMainPageRoute : AppRoutes.logInRoute,
      ),
    );
    return Scaffold(
      body: BlocConsumer<SharedPCubit,SharedPStates>(
        listener: (context,state){},
        builder: (context,state){
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppAssets.blurPath,
                fit: BoxFit.cover,
              ),
              Image.asset(AppAssets.logoPath),
            ],
          );
        },
      ),
    );
  }
}
