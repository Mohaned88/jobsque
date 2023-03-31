import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_states.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../03_widgets/custom_elevated_button.dart';
import 'cards/job_type_card.dart';

class FilterBottomSheetBtn extends StatelessWidget {
  final String? title;
  final List<String> titles;
  final List<String> types;
  final List<Color> borderNLabelColors;
  final List<Color> fillColors;

  const FilterBottomSheetBtn({
    Key? key,
    this.title,
    required this.titles,
    required this.types,
    required this.borderNLabelColors,
    required this.fillColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterBSCubit filterBSCubit = FilterBSCubit.get(context);
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: FilterChip(
        backgroundColor: titles.length <=1 ?AppColors.white : AppColors.kDarkBlue,
        side: BorderSide(
          color: titles.length <=1 ?AppColors.lightGrey : AppColors.kDarkBlue,
        ),
        label: Row(
          children: [
            CustomText(
              text: title ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1.4,
              color: titles.length <=1 ?AppColors.kPrimaryBlack : AppColors.white,
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: titles.length <=1 ?AppColors.kPrimaryBlack : AppColors.white,
            ),
          ],
        ),
        onSelected: (value) {
          showMaterialModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.w),
                topLeft: Radius.circular(5.w),
              ),
            ),
            builder: (context) => BlocProvider.value(
              value: filterBSCubit,
              child: TypesBottomSheetContent(
                title: title,
                titles: titles,
                types: types,
                borderNLabelColors: borderNLabelColors,
                fillColors: fillColors,
              ),
            ),
          );
        },
      ),
    );
  }
}

class TypesBottomSheetContent extends StatelessWidget {
  final String? title;
  final List<String> types;
  final List<String> titles;
  final List<Color> borderNLabelColors;
  final List<Color> fillColors;
  const TypesBottomSheetContent({
    Key? key,
    this.title,
    required this.titles,
    required this.types,
    required this.borderNLabelColors,
    required this.fillColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterBSCubit filterBSCubit = FilterBSCubit.get(context);
    return BlocConsumer<FilterBSCubit,FilterBSStates>(
      listener: (context,state){},
      builder: (context,state)=> SizedBox(
          height: 60.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: titles.isEmpty ? title! : titles.join('/'),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  height: 1.3,
                  color: AppColors.kPrimaryBlack,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    4,
                        (index) => JobTypeCard(
                      label: types[index],
                      horizontalPadding: 5.w,
                      labelColor: borderNLabelColors[index],
                      fillColor: fillColors[index],
                      borderColor: borderNLabelColors[index],
                      onTap: () {
                        filterBSCubit.changeTypeFiltersJobTypeCardColor(index, '$title');
                      },
                    ),
                  ),
                ),
                CustomElevatedButton(
                  height: 13.w,
                  width: double.infinity,
                  borderRadius: 10.w,
                  backgroundColor: AppColors.kPrimaryColor,
                  alignment: Alignment.center,
                  onPressed: () {},
                  label: 'Show Result',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
