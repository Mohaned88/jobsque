import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_states.dart';

import '../../../../01_model/07_message_model/message_model.dart';

class MessagesCubit extends Cubit<MessagesStates> {
  MessagesCubit() : super(InitialMessagesState());

  static MessagesCubit get(BuildContext context) =>
      BlocProvider.of<MessagesCubit>(context);

  List<MessageModel> messages = List.generate(5, (index) => MessageModel(
    id: 0,
    time: DateTime.now().toString(),
    date: DateTime.now().weekday.toString(),
    message: 'welcome mohaned we have received your application',
    receiverID: 'ri1',
    senderID: 'si1',
    senderName: 'Twitter',
  ),);
}
