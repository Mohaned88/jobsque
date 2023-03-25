import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_states.dart';

import '../../../../01_model/06_notification_model/notification_model.dart';
import '../../../../02_view/04_utilities/res/assets.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(InitialNotificationState());

  static NotificationCubit get(BuildContext context) =>
      BlocProvider.of<NotificationCubit>(context);

  List<NotificationModel> notificationModel = List.generate(
    6,
    (index) => NotificationModel(
      id: index,
      title: 'hi $index',
      description: 'Welcome to Jobsque',
      date: DateTime.now().weekday.toString(),
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      logo: AppAssets.twitterLogo,
    ),
  );

  List<bool> notificationSettingValue = List.generate(8, (index) => false);

  changeSettingValue(int index,bool value){
    notificationSettingValue[index] = value;
    emit(ChangeSettingValueState());
  }
}
