import 'package:flutter/material.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/home/home_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/location_selection/preferred_loaction_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved_cubit/saved_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/type_selection/work_type_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/shared/shared_prefs_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_cubit.dart';
import 'package:sizer/sizer.dart';
import '02_view/01_presentation/01_onboarding/01_splash.dart';
import '03_controller/00_navigation/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '03_controller/03_cubit/widgets/account/button/account_button_cubit.dart';
import '03_controller/03_cubit/widgets/account/textfield/text_field_cubit.dart';
import '03_controller/03_cubit/widgets/onboarding/onboarding_button_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingButtonCubit(),
        ),
        BlocProvider(
          create: (context) => AccButtonCubit(),
        ),
        BlocProvider(
          create: (context) => TextFieldCubit(),
        ),
        BlocProvider(
          create: (context) => WorkTypeCubit(),
        ),
        BlocProvider(
          create: (context) => PrefLocationCubit(),
        ),
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(
          create: (context) => ApplyJobCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FilterBSCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
        BlocProvider(
          create: (context) => SavedCubit(),
        ),
        BlocProvider(
          create: (context) => MessagesCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SharedPCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        home: SplashScreen(),
      ),
    );
  }
}
