import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/language/language_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../03_controller/03_cubit/screens/language/language_states.dart';
import '../../../03_widgets/custom_text.dart';
import '../../../04_utilities/res/strings.dart';
import '../../../05_styles/colors.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageCubit languageCubit = LanguageCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      appBar: AppBar(
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
          text: AppStrings.profileLanguage,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.2,
          color: AppColors.kPrimaryBlack,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<LanguageCubit,LanguageStates>(
        listener: (context,state){},
        builder: (context,state)=>ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            itemBuilder: (BuildContext context, int index) =>
                GestureDetector(
                  onTap: (){
                    languageCubit.changeIconColor(index, token: AuthCubit.authorizationToken, userID: authCubit.userModel.id!);
                  },
                  child: SizedBox(
                    height: 12.w,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          AppAssets.languagesFlags[index],
                          width: 8.w,
                        ),
                        SizedBox(width: 3.w,),
                        Expanded(
                          child: CustomText(
                            text: AppStrings.languages[index],
                            color: AppColors.kPrimaryBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                        Icon(languageCubit.iconType[index],color: languageCubit.iconColors[index],),
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) => const Divider(
              color: AppColors.midLightGrey,
            ),
            itemCount: AppStrings.languages.length),
      ),

    );
  }
}
