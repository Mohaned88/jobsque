import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/cards/notification_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/notifications/notifications_states.dart';
import 'package:sizer/sizer.dart';

import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/strings.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationCubit notificationCubit = NotificationCubit.get(context);
    return Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverAppBar(
             leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon: const Icon(Icons.arrow_back,color: AppColors.iconsBlack,),
             ),
             title: const CustomText(
               text: AppStrings.notificationScreenTitle,
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
             child: BlocConsumer<NotificationCubit,NotificationStates>(
               listener: (context,state){},
               builder: (context,state){
                 if(notificationCubit.notificationModel.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.noNotificationsImage,
                                width: 50.w,
                                height: 50.w,
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              const CustomText(
                                text: AppStrings.noNotificationsTitle,
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
                                text: AppStrings.noNotificationsSubTitle,
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
                    );
                  }
                 else{
                   return Column(
                     children: [
                       Container(
                         width: double.infinity,
                         color: AppColors.offWhite2,
                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                         child: const CustomText(
                           text: 'New',
                           fontWeight: FontWeight.w500,
                           fontSize: 14,
                           height: 1.4,
                           color: AppColors.grey,
                         ),
                       ),
                       Column(
                         children: List.generate(notificationCubit.notificationModel.length, (index) => NotificationCard(
                           notificationModel: notificationCubit.notificationModel[index],
                         ),),
                       ),
                     ],
                   );
                 }
                }
             ),
           ),


         ],
       ),
    );
  }
}
