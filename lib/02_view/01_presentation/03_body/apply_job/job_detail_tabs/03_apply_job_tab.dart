import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/01_model/03_employee_model/employee_model.dart';
import 'package:jobsque/02_view/02_components/cards/employee_card.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/04_utilities/res/constants.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_States.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../04_utilities/res/strings.dart';

class ApplyJobTab3 extends StatelessWidget {
  final List<EmployeeModel> employees;
  final List<String> positionList;

  const ApplyJobTab3({
    Key? key,
    required this.employees,
    required this.positionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplyJobCubit applyJpbCubit = ApplyJobCubit.get(context);
    return SingleChildScrollView(
      child: BlocConsumer<ApplyJobCubit,ApplyJobStates>(
        listener: (context,state){},
        builder: (context,state)=> SizedBox(
          height: 150.w,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 15.w,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                            '${AppConstants.employees.length} ${AppStrings.applyJobPeopleNumberOfEmployees}',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.kPrimaryBlack,
                          ),
                          CustomText(
                            text: applyJpbCubit.jobType,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.5,
                            color: AppColors.textsGrey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 11.w,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: DropdownButton(
                        value: applyJpbCubit.jobType,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        elevation: 0,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: AppColors.kPrimaryBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                        items: positionList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(
                              text: value,
                              color: AppColors.kPrimaryBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          applyJpbCubit.changeJobTypeThroughFilter(selectedType: value!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                  employees.length,
                      (int index) =>
                      EmployeeCard(employeeModel: employees[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
