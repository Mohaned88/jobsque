import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_cubit.dart';
import '../../03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_states.dart';
import '../03_widgets/custom_elevated_button.dart';
import '../03_widgets/custom_text.dart';
import '../03_widgets/custom_text_field_ver2.dart';
import '../04_utilities/res/strings.dart';
import '../05_styles/colors.dart';
import 'cards/job_type_card.dart';
class MyCustomBottomSheet extends StatefulWidget {
  const MyCustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyCustomBottomSheet> createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  Color testColor = AppColors.red;
  @override
  Widget build(BuildContext context) {
    FilterBSCubit filterBSCubit = FilterBSCubit.get(context);
    return BlocConsumer<FilterBSCubit,FilterBSStates>(
        listener: (context,state){},
        builder: (context,state)=> BlocProvider.value(
          value: filterBSCubit,
          child: SizedBox(
            height: 90.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        primary: false,
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
                          text: 'Set Filter',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          fontSize: 20,
                          color: AppColors.kPrimaryBlack,
                        ),
                        centerTitle: true,
                        actions: [
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: const CustomText(
                                text: 'Reset',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.3,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                              height: 3.w,
                            ),
                            const CustomText(
                              text: 'Job Title',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            CustomTextFieldVer2(
                              enabledBorderColor: AppColors.lightGrey,
                              focusedBorderColor: AppColors.kPrimaryColor,
                              errorBorderColor: AppColors.red,
                              borderRadius: 3.w,
                              hintText: 'Job title...',
                              width: double.infinity,
                              height: 14.w,
                              controller: jobTitleController,
                              prefixIcon: Image.asset(AppAssets.briefCaseIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: 'Location',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            CustomTextFieldVer2(
                              enabledBorderColor: AppColors.lightGrey,
                              focusedBorderColor: AppColors.kPrimaryColor,
                              errorBorderColor: AppColors.red,
                              borderRadius: 3.w,
                              hintText: 'Location...',
                              width: double.infinity,
                              height: 14.w,
                              controller: locationController,
                              prefixIcon: Image.asset(AppAssets.locationIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: 'Salary',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            CustomTextFieldVer2(
                              enabledBorderColor: AppColors.lightGrey,
                              focusedBorderColor: AppColors.kPrimaryColor,
                              errorBorderColor: AppColors.red,
                              borderRadius: 3.w,
                              hintText: 'Salary...',
                              width: double.infinity,
                              height: 14.w,
                              controller: salaryController,
                              prefixIcon: Image.asset(AppAssets.dollarCircleIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                              suffixIcon: PopupMenuButton(
                                icon: Icon(Icons.keyboard_arrow_down_outlined,size: 7.w,color: AppColors.iconsBlack,),
                                padding: const EdgeInsets.all(0),
                                onSelected: (value){
                                  setState(() {
                                    salaryController.text = value.toString();
                                  });
                                },
                                itemBuilder: (BuildContext context){
                                  return List<PopupMenuEntry>.generate(3, (index) => PopupMenuItem(child: Text('hi $index'),value: 'hi $index',));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const CustomText(
                              text: 'Job Type',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.kPrimaryBlack,
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                          ],
                        ),
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: AppStrings.searchFilterJobTypes.length,
                              (context, index) => JobTypeCard(
                            label: AppStrings.searchFilterJobTypes[index],
                            onTap: () {
                              /*setState(() {
                                testColor = testColor==AppColors.red? AppColors.green : AppColors.red;
                              });*/
                              filterBSCubit.changeJobTypeCardColor(index);
                            },
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            labelColor: filterBSCubit.labelColor[index],
                            borderColor: filterBSCubit.borderColor[index],
                            fillColor: filterBSCubit.fillColor[index],
                            verticalPadding: 2.w,
                            horizontalPadding: 3.w,
                          ),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 2.w,
                          childAspectRatio: 3,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 18.w,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5.w,
                    right: 5.w,
                    left: 5.w,
                    child: CustomElevatedButton(
                      height: 13.w,
                      width: double.infinity,
                      borderRadius: 10.w,
                      backgroundColor: AppColors.kPrimaryColor,
                      alignment: Alignment.center,
                      onPressed: () {},
                      label: 'Show Result',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );

  }
}


showCustomBottomSheet(BuildContext context) {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  return showMaterialModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.w),
        topLeft: Radius.circular(5.w),
      ),
    ),
    builder: (context) => SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  primary: false,
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
                    text: 'Set Filter',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    fontSize: 20,
                    color: AppColors.kPrimaryBlack,
                  ),
                  centerTitle: true,
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: 'Reset',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.3,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 3.w,
                      ),
                      const CustomText(
                        text: 'Job Title',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        fontSize: 16,
                        color: AppColors.kPrimaryBlack,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      CustomTextFieldVer2(
                        enabledBorderColor: AppColors.lightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        borderRadius: 3.w,
                        hintText: 'Job title...',
                        width: double.infinity,
                        height: 14.w,
                        controller: jobTitleController,
                        prefixIcon: Image.asset(AppAssets.briefCaseIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      const CustomText(
                        text: 'Location',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        fontSize: 16,
                        color: AppColors.kPrimaryBlack,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      CustomTextFieldVer2(
                        enabledBorderColor: AppColors.lightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        borderRadius: 3.w,
                        hintText: 'Location...',
                        width: double.infinity,
                        height: 14.w,
                        controller: locationController,
                        prefixIcon: Image.asset(AppAssets.locationIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      const CustomText(
                        text: 'Salary',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        fontSize: 16,
                        color: AppColors.kPrimaryBlack,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      CustomTextFieldVer2(
                        enabledBorderColor: AppColors.lightGrey,
                        focusedBorderColor: AppColors.kPrimaryColor,
                        errorBorderColor: AppColors.red,
                        borderRadius: 3.w,
                        hintText: 'Salary...',
                        width: double.infinity,
                        height: 14.w,
                        controller: salaryController,
                        prefixIcon: Image.asset(AppAssets.dollarCircleIcon,color: AppColors.iconsBlack,width: 6.w,height: 6.w,),
                        suffixIcon: PopupMenuButton(
                          icon: Icon(Icons.keyboard_arrow_down_outlined,size: 7.w,color: AppColors.iconsBlack,),
                          padding: const EdgeInsets.all(0),
                          onSelected: (value){
                            salaryController.text = value.toString();
                          },
                          itemBuilder: (BuildContext context){
                            return List<PopupMenuEntry>.generate(3, (index) => PopupMenuItem(child: Text('hi $index')));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      const CustomText(
                        text: 'Job Type',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        fontSize: 16,
                        color: AppColors.kPrimaryBlack,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: AppStrings.searchFilterJobTypes.length,
                    (context, index) => JobTypeCard(
                      label: AppStrings.searchFilterJobTypes[index],
                      onTap: () {},
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      labelColor: AppColors.grey,
                      borderColor: AppColors.lightGrey,
                      fillColor: AppColors.white,
                      verticalPadding: 2.w,
                      horizontalPadding: 3.w,
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.w,
                    childAspectRatio: 3,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 18.w,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 5.w,
              right: 5.w,
              left: 5.w,
              child: CustomElevatedButton(
                height: 13.w,
                width: double.infinity,
                borderRadius: 10.w,
                backgroundColor: AppColors.kPrimaryColor,
                alignment: Alignment.center,
                onPressed: () {},
                label: 'Show Result',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
