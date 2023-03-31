import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/01_presentation/03_body/applied_job_tabs/01_active_jobs_tab.dart';
import 'package:jobsque/02_view/01_presentation/03_body/applied_job_tabs/02_rejected_jobs_tab.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_States.dart';
import 'package:jobsque/03_controller/03_cubit/screens/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../03_widgets/custom_text.dart';
import '../../04_utilities/res/strings.dart';
import '../../05_styles/colors.dart';

class AppliedJobMainScreen extends StatelessWidget {
  const AppliedJobMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          text: AppStrings.appliedJobScreenTitle,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.w,horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(2.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.offWhite2,
                  ),
                  child: TabBar(
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      color: AppColors.kDarkBlue,
                    ),
                    tabs: List.generate(
                      AppStrings.appliedJobTabsTitles.length,
                      (index) => Tab(
                        icon: CustomText(
                          text: AppStrings.appliedJobTabsTitles[index],
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                    onTap: (int index) {},
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.kPrimaryBlack,
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<ApplyJobCubit,ApplyJobStates>(
                  listener: (context,state){},
                  builder: (context,state)=>const TabBarView(
                    children: [
                      ActiveJobsTab(),
                      RejectedJobsTab(),
                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
