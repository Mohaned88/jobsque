import 'package:flutter/material.dart';
import 'package:jobsque/02_view/01_presentation/03_body/00_body_main.dart';
import 'package:jobsque/02_view/01_presentation/03_body/02_search.dart';
import 'package:jobsque/02_view/01_presentation/03_body/03_notifications.dart';
import 'package:jobsque/02_view/01_presentation/03_body/04_saved.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/02_personal_Info_apply_form.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/03_type_of_work.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/04_uploade_docs.dart';
import 'package:jobsque/02_view/01_presentation/03_body/apply_job/05_back_to_home.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/01_edit_profile.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/02_portfolio.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/03_languages.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/04_notification_settings.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/privacy_policy.dart';
import 'package:jobsque/02_view/01_presentation/03_body/profile_tabs/terms_and_conditions.dart';
//---------------------------OnBoarding
import '../../02_view/01_presentation/01_onboarding/01_splash.dart';
import '../../02_view/01_presentation/01_onboarding/02_onboarding.dart';
//---------------------------Account
import '../../02_view/01_presentation/02_account/01_signup.dart';
import '../../02_view/01_presentation/02_account/02_login.dart';
import '../../02_view/01_presentation/02_account/03_type_selection.dart';
import '../../02_view/01_presentation/02_account/04_location_selection.dart';
import '../../02_view/01_presentation/02_account/05_acc_setup_success_screen.dart';
import '../../02_view/01_presentation/02_account/06_reset_password.dart';
import '../../02_view/01_presentation/02_account/07_check_email.dart';
import '../../02_view/01_presentation/02_account/08_create_password.dart';
import '../../02_view/01_presentation/02_account/09_pass_changed_successfully.dart';

import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashRoute:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: routeSettings,
      );

    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
        settings: routeSettings,
      );

    case AppRoutes.signUpRoute:
      return MaterialPageRoute(
        builder: (context) => SignUpScreen(),
        settings: routeSettings,
      );

    case AppRoutes.logInRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
        settings: routeSettings,
      );

    case AppRoutes.workTypeRoute:
      return MaterialPageRoute(
        builder: (context) => const TypeSelectionScreen(),
        settings: routeSettings,
      );

    case AppRoutes.setUpSuccessRoute:
      return MaterialPageRoute(
        builder: (context) => const SetUpSuccessScreen(),
        settings: routeSettings,
      );

    case AppRoutes.resetPasswordRoute:
      return MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
        settings: routeSettings,
      );

    case AppRoutes.checkEmailRoute:
      return MaterialPageRoute(
        builder: (context) => const CheckEmailScreen(),
        settings: routeSettings,
      );

    case AppRoutes.locationSelectRoute:
      return MaterialPageRoute(
        builder: (context) => const LocationSelectionScreen(),
        settings: routeSettings,
      );

    case AppRoutes.passSuccessRoute:
      return MaterialPageRoute(
        builder: (context) => const PassChangedScreen(),
        settings: routeSettings,
      );

    case AppRoutes.createNewPasswordRoute:
      return MaterialPageRoute(
        builder: (context) => const NewPasswordScreen(),
        settings: routeSettings,
      );

    case AppRoutes.bodyMainPageRoute:
      return MaterialPageRoute(
        builder: (context) => const BodyMainScreen(),
        settings: routeSettings,
      );

    case AppRoutes.applyJobBioDataPageRoute:
      return MaterialPageRoute(
        builder: (context) => const BioDataScreen(),
        settings: routeSettings,
      );

    case AppRoutes.applyJobTypeOfWorkPageRoute:
      return MaterialPageRoute(
        builder: (context) => const TypeOfWorkScreen(),
        settings: routeSettings,
      );

    case AppRoutes.applyJobUploadDocsPageRoute:
      return MaterialPageRoute(
        builder: (context) => const UploadDocsScreen(),
        settings: routeSettings,
      );

    case AppRoutes.applyJobBackToHomePageRoute:
      return MaterialPageRoute(
        builder: (context) => const BackToHomeScreen(),
        settings: routeSettings,
      );

    case AppRoutes.searchPageRoute:
      return MaterialPageRoute(
        builder: (context) => const SearchScreen(),
        settings: routeSettings,
      );

    case AppRoutes.notificationsPageRoute:
      return MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
        settings: routeSettings,
      );

    case AppRoutes.savedPageRoute:
      return MaterialPageRoute(
        builder: (context) => const SavedScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profileEditProfileRoute:
      return MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profileLanguageSelectionRoute:
      return MaterialPageRoute(
        builder: (context) => const LanguageSelectionScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profileNotificationSettingsRoute:
      return MaterialPageRoute(
        builder: (context) => const NotificationSettingsScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profilePortfolioRoute:
      return MaterialPageRoute(
        builder: (context) => const PortfolioScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profileTermsNConditionsRoute:
      return MaterialPageRoute(
        builder: (context) => TermsNConditionsScreen(),
        settings: routeSettings,
      );

    case AppRoutes.profilePrivacyPolicyRoute:
      return MaterialPageRoute(
        builder: (context) => PrivacyPolicyScreen(),
        settings: routeSettings,
      );


    default:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: routeSettings,
      );
  }
}
