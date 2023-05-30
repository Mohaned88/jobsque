import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/bottom_nav_bar/bottom_nav_bar_states.dart';

import '../../../03_controller/03_cubit/auth/auth_cubit.dart';
import '../../../03_controller/03_cubit/screens/home/home_cubit.dart';
import '../../../03_controller/03_cubit/screens/saved/saved_cubit.dart';

class BodyMainScreen extends StatelessWidget {
  const BodyMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomBarCubit bottomBarCubit = BottomBarCubit.get(context);
    return BlocConsumer<BottomBarCubit, BottomBarStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: bottomBarCubit.bodySc,
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomBarCubit.currentIndex,
          onTap: (int index) {
            bottomBarCubit.changeIndex(index);
            if (index == 3) {
              SavedCubit.get(context).showAllFavoritesFromAPI(
                token: AuthCubit.authorizationToken,
                userID: AuthCubit.get(context).userModel.id!,
                context: context,
              );
            }
            if(index ==0){
              HomeCubit.get(context).getRecentJobList(token: AuthCubit.authorizationToken);
              HomeCubit.get(context).getSuggestJobList(
                  token: AuthCubit.authorizationToken,
                  userID: AuthCubit.get(context).userModel.id!);
              SavedCubit.get(context).showAllFavoritesFromAPI(
                token: AuthCubit.authorizationToken,
                userID: AuthCubit.get(context).userModel.id!,
                context: context,
              );
            }
          },
          unselectedLabelStyle: const TextStyle(
            color: AppColors.midLightGrey,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          selectedLabelStyle: const TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: AppColors.midLightGrey,
          items: List.generate(
            5,
            (index) => BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.bottomBarIcon[index],
              ),
              activeIcon: Image.asset(
                AppAssets.bottomBarActiveIcon[index],
              ),
              label: AppStrings.bottomBarPageName[index],
              backgroundColor: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
