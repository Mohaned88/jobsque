import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jobsque/02_view/03_widgets/notification_setting_widget.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_states.dart';
import 'package:sizer/sizer.dart';

import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationCubit notificationCubit = NotificationCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.kPrimaryBlack,
              ),
            ),
            title: const CustomText(
              text: AppStrings.profileNotification,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.2,
              color: AppColors.kPrimaryBlack,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10.w,
              width: double.infinity,
              color: AppColors.offWhite2,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Align(
                alignment: FractionalOffset.centerLeft,
                child: CustomText(
                  text: AppStrings.notificationJobNotification,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
          BlocConsumer<NotificationCubit,NotificationStates>(
            listener: (context,state){},
            builder: (context,state)=>
                SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[0],
                          settingTitle: AppStrings.notificationSearchAlert,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(0, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[1],
                          settingTitle: AppStrings.notificationApplicationUpdate,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(1, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[2],
                          settingTitle: AppStrings.notificationApplicationReminder,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(2, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[3],
                          settingTitle: AppStrings.notificationInterestedJobs,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(3, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[4],
                          settingTitle: AppStrings.notificationSeekerUpdates,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(4, value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 10.w,
              width: double.infinity,
              color: AppColors.offWhite2,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Align(
                alignment: FractionalOffset.centerLeft,
                child: CustomText(
                  text: AppStrings.notificationOther,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
          BlocConsumer<NotificationCubit,NotificationStates>(
            listener: (context,state){},
            builder: (context,state)=>SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[5],
                          settingTitle: AppStrings.notificationShowProfile,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(5, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[6],
                          settingTitle: AppStrings.notificationAllMessage,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(6, value);
                          },
                        ),
                        NotificationSettingWidget(
                          value: notificationCubit.notificationSettingValue[7],
                          settingTitle: AppStrings.notificationMessageNudges,
                          onToggle: (bool value) {
                            notificationCubit.changeSettingValue(7, value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
