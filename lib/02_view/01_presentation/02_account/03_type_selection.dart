import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/01_work_model/work_model.dart';
import 'package:jobsque/02_view/02_components/cards/work_type_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/00_navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../03_controller/03_cubit/screens/type_selection/work_type_cubit.dart';
import '../../../03_controller/03_cubit/screens/type_selection/work_type_states.dart';
import '../../03_widgets/custom_elevated_button.dart';
import '../../04_utilities/res/strings.dart';

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkTypeCubit workTypeCubit = WorkTypeCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomText(
                text: AppStrings.workTypeQuestion,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.kPrimaryBlack,
                height: 1.4,
              ),
              SizedBox(
                height: 3.w,
              ),
              const CustomText(
                text: AppStrings.workTypeSubTitle,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textsGrey,
                height: 1.3,
              ),
              SizedBox(
                height: 8.w,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: AppStrings.workTypeTitles.length,
                  itemBuilder: (context, index) =>
                      BlocConsumer<WorkTypeCubit, WorkTypeStates>(
                        listener: (context, state) {},
                        builder: (context, state) => WorkTypeCard(
                          workTypeModel: WorkTypeModel(
                            photo: AppAssets.workTypePhotos[index],
                            title: AppStrings.workTypeTitles[index],
                          ),
                          onTap: (){
                            workTypeCubit.wtCardColorChange(index,title: AppStrings.workTypeTitles[index]);
                          },
                          fillColor: workTypeCubit.fillColor[index],
                          iconColor: workTypeCubit.iconColor[index],
                          borderColor: workTypeCubit.borderColor[index],
                        ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 6).w,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 5.w,
                    //mainAxisExtent: 40.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.locationSelectRoute);
                  },
                  label: AppStrings.onBoardingNext,
                  width: 88.w,
                  alignment: Alignment.center,
                  height: 13.w,
                  borderRadius: 10.w,
                  backgroundColor: AppColors.kPrimaryColor,
                  labelFontSize: 16,
                  labelFontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
