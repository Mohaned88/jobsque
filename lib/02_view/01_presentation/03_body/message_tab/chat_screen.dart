import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/cards/message_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_states.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../02_components/job_filter_bottom_sheet.dart';

class ChatScreen extends StatefulWidget {
  final int userID;
  final int compID;

  const ChatScreen({
    Key? key,
    required this.userID,
    required this.compID,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    MessagesCubit.get(context).getChatList(
      token: AuthCubit.authorizationToken,
      userId: widget.userID,
      compId: widget.compID,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MessagesCubit messagesCubit = MessagesCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MessagesCubit, MessagesStates>(
          listener: (context, state) {},
          builder: (context, state) => CustomScrollView(
            slivers: [
              SliverAppBar(
                primary: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.iconsBlack,
                  ),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.twitterLogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    const CustomText(
                      text: AppStrings.messagesScreenTitle,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.3,
                      color: AppColors.kPrimaryBlack,
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.w),
                            topLeft: Radius.circular(5.w),
                          ),
                        ),
                        builder: (_) => const MyCustomBottomSheet(),
                      );
                    },
                    icon: Image.asset(
                      AppAssets.savedJobsMoreIcon,
                      width: 7.w,
                      height: 7.w,
                    ),
                  ),
                ],
                leadingWidth: 10.w,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => MessageCard(
                    message: '${messagesCubit.messages[index].message}',
                    isIncoming: '${messagesCubit.messages[index].senderUser}',
                    dateTime: DateTime.parse(
                        '${messagesCubit.messages[index].createdAt}'),
                  ),
                  childCount: messagesCubit.messages.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
