import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_states.dart';

import '../../../../01_model/07_message_model/message_model.dart';

class MessagesCubit extends Cubit<MessagesStates> {
  MessagesCubit() : super(InitialMessagesState());

  static MessagesCubit get(BuildContext context) =>
      BlocProvider.of<MessagesCubit>(context);

  List<MessageModel> messagesList =[];
  List companies =[1,2,3];

  getChatList({required int userId,required int compId,required String token}) async{
    messagesList =[];
    emit(LoadingMessagesListState());
    try {
      Uri url = Uri.parse('http://${AppConstants.getChatLink}user_id=$userId&comp_id=$compId');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().get(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      if(response.statusCode == 200) {
        print(response.data);
        response.data['data'].forEach(
              (element) {
            messagesList.add(
              MessageModel.fromMap(element),
            );
          },
        );
        emit(GetMessagesListSuccessState());
      }
      else{
        emit(GetMessagesListFailState());
      }
    } catch (e) {
      print(
          '====================>>>>>>>>>>>>> Get Chat List Failed With Error $e');
    }
  }

  sendMessage({required int userId,required int compId,required String message,required String token}) async{
    try {
      Uri url = Uri.parse('http://${AppConstants.userSendLink}massage=$message&user_id=$userId&comp_id=$compId');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await Dio().post(
        '$url',
        options: Options(
          headers: headers,
        ),
      );
      if(response.statusCode == 200) {
        print(response.data);
        getChatList(userId: userId, compId: compId, token: token);
        emit(SentMessageSuccessState());
      }
      else{
        emit(SentMessageFailState());
      }
    } catch (e) {
      print(
          '====================>>>>>>>>>>>>> Sending Message Failed With Error $e');
    }
  }
}
