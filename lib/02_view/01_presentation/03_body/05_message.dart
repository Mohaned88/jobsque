import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/message_tab/chat_screen.dart';
import 'package:jobsque/02_view/02_components/cards/message_preview_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field_ver2.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/messages/messages_states.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/00_navigation/routes.dart';
import '../../03_widgets/custom_elevated_button_ver2.dart';
import '../../03_widgets/custom_text.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';
import 'apply_job/01_apply_job_main.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessagesCubit messagesCubit = MessagesCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
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
                color: AppColors.iconsBlack,
              ),
            ),
            title: const CustomText(
              text: AppStrings.messagesScreenTitle,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.2,
              color: AppColors.kPrimaryBlack,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(13.w),
              child: Container(
                height: 13.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextFieldVer2(
                        enabledBorderColor: AppColors.lightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        borderRadius: 10.w,
                        prefixIcon: Image.asset(AppAssets.searchToolIcon),
                        hintText: 'Search messages....',
                        hintColor: AppColors.midLightGrey,
                        hintFontWeight: FontWeight.w400,
                        hintFontSize: 14,
                        hintHeight: 1.4,
                      ),
                    ),
                    Container(
                      width: 12.w,
                      height: 12.w,
                      margin: EdgeInsets.only(left: 2.w),
                      padding: EdgeInsets.all((3 / 4).w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            ///////////////////
                            useRootNavigator: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.w),
                                topLeft: Radius.circular(5.w),
                              ),
                            ),
                            builder: (context) => BlocProvider.value(
                              value: messagesCubit,
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: SizedBox(
                                  height: 30.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const CustomText(
                                        text: 'Message filters',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        height: 1.3,
                                      ),
                                      CustomElevatedButtonVer2(
                                        onPressed: () {},
                                        label: 'Unread',
                                        backgroundColor: AppColors.white,
                                        labelColor: AppColors.kPrimaryBlack,
                                        width: double.infinity,
                                        height: 12.w,
                                        borderColor: AppColors.lightGrey,
                                        borderRadius: 10.w,
                                        suffixIcon: Icons.keyboard_arrow_right,
                                        suffixIconColor: AppColors.iconsBlack,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      CustomElevatedButtonVer2(
                                        onPressed: () {},
                                        label: 'Spam',
                                        backgroundColor: AppColors.white,
                                        labelColor: AppColors.kPrimaryBlack,
                                        width: double.infinity,
                                        height: 12.w,
                                        borderColor: AppColors.lightGrey,
                                        borderRadius: 10.w,
                                        suffixIcon: Icons.keyboard_arrow_right,
                                        suffixIconColor: AppColors.iconsBlack,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      CustomElevatedButtonVer2(
                                        onPressed: () {},
                                        label: 'Archived',
                                        backgroundColor: AppColors.white,
                                        labelColor: AppColors.kPrimaryBlack,
                                        width: double.infinity,
                                        height: 12.w,
                                        borderColor: AppColors.lightGrey,
                                        borderRadius: 10.w,
                                        suffixIcon: Icons.keyboard_arrow_right,
                                        suffixIconColor: AppColors.iconsBlack,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Image.asset(AppAssets.settingsIcon),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<MessagesCubit, MessagesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (messagesCubit.companies.isEmpty) {
                //if empty
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.noMessagesImage,
                              width: 50.w,
                              height: 50.w,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: AppStrings.noMessagesTitle,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              color: AppColors.textsBlack,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            const CustomText(
                              text: AppStrings.noMessagesSubTitle,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              color: AppColors.grey,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              else {
                //if Not Empty
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 3,
                    (context, index) => MessagePreviewCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ChatScreen(userID: authCubit.userModel.id!, compID: index+1,),
                          ),
                        );
                      },
                    ),
                  ),
                );
                //if not empty
              }
            },
          ),
        ],
      ),
    );
  }
}
