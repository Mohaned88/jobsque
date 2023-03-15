import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '02_onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        AppRoutes.onBoardingRoute,
      ),
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.blurPath,
            fit: BoxFit.cover,
          ),
          Image.asset(AppAssets.logoPath),
        ],
      ),
    );
  }
}
