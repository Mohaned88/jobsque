import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/02_view/02_components/filter_bottom_sheet_button.dart';
import 'package:jobsque/02_view/02_components/job_filter_bottom_sheet.dart';
import 'package:jobsque/02_view/02_components/search_job_preview.dart';
import 'package:jobsque/02_view/03_widgets/custom_text.dart';
import 'package:jobsque/02_view/03_widgets/custom_text_field_ver2.dart';
import 'package:jobsque/02_view/05_styles/colors.dart';
import 'package:jobsque/03_controller/03_cubit/auth/auth_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved/saved_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/saved/saved_states.dart';
import 'package:jobsque/03_controller/03_cubit/screens/search/search_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/screens/search/search_states.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_cubit.dart';
import 'package:jobsque/03_controller/03_cubit/widgets/body/filter_bottom_sheet/filter_bottom_sheet_states.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import '../../02_components/cards/job_preview_card.dart';
import '../../04_utilities/res/assets.dart';
import '../../04_utilities/res/constants.dart';
import '../../04_utilities/res/strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = SearchCubit.get(context);
    FilterBSCubit filterBSCubit = FilterBSCubit.get(context);
    SavedCubit savedCubit = SavedCubit.get(context);
    AuthCubit authCubit = AuthCubit.get(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.iconsBlack,
            ),
          ),
          leadingWidth: 10.w,
          title: CustomTextFieldVer2(
            height: 12.w,
            width: double.infinity,
            prefixIcon: Image.asset(AppAssets.searchToolIcon),
            enabledBorderColor: AppColors.lightGrey,
            borderRadius: 20.w,
            focusedBorderColor: AppColors.kPrimaryColor,
            errorBorderColor: AppColors.red,
            hintText: AppStrings.homeScreenSearch,
            hintColor: AppColors.textsGrey,
            controller: searchController,
            onFieldSubmitted: (String text) {
              searchCubit.getSuggestJobList(
                  token: AuthCubit.authorizationToken, searchText: text);
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is RetrieveSearchListSuccessState) {
              return CustomScrollView(
                slivers: [
                  BlocConsumer<SavedCubit, SavedStates>(
                    listener: (context, state) {},
                    builder: (context, state) =>
                        BlocConsumer<FilterBSCubit, FilterBSStates>(
                      listener: (context, state) {},
                      builder: (context, state) => SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12.w,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == 0) {
                                    return IconButton(
                                      onPressed: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.w),
                                              topLeft: Radius.circular(5.w),
                                            ),
                                          ),
                                          builder: (_) => BlocProvider.value(
                                            value: filterBSCubit,
                                            child: const MyCustomBottomSheet(),
                                          ),
                                        );
                                      },
                                      icon: Image.asset(
                                        AppAssets.settingsIcon,
                                        width: 7.w,
                                        height: 7.w,
                                      ),
                                    );
                                  } else {
                                    return FilterBottomSheetBtn(
                                      title: AppStrings
                                              .searchScreenFilterNamesList[
                                          index - 1],
                                      types: AppStrings.inSideFiltersTypesNames[
                                          AppStrings
                                                  .searchScreenFilterNamesList[
                                              index - 1]]!,
                                      fillColors: index - 1 == 0
                                          ? filterBSCubit.remoteFillColor
                                          : index - 1 == 1
                                              ? filterBSCubit.fulltimeFillColor
                                              : index - 1 == 2
                                                  ? filterBSCubit
                                                      .postdateFillColor
                                                  : filterBSCubit.expFillColor,
                                      borderNLabelColors: index - 1 == 0
                                          ? filterBSCubit
                                              .remoteBorderNLabelColor
                                          : index - 1 == 1
                                              ? filterBSCubit
                                                  .fulltimeBorderNLabelColor
                                              : index - 1 == 2
                                                  ? filterBSCubit
                                                      .postdateBorderNLabelColor
                                                  : filterBSCubit
                                                      .expBorderNLabelColor,
                                      titles: index - 1 == 0
                                          ? filterBSCubit.remoteSelectedTitles
                                          : index - 1 == 1
                                              ? filterBSCubit
                                                  .fulltimeSelectedTitles
                                              : index - 1 == 2
                                                  ? filterBSCubit
                                                      .postdateSelectedTitles
                                                  : filterBSCubit
                                                      .expSelectedTitles,
                                    );
                                  }
                                },
                                itemCount: AppStrings
                                        .searchScreenFilterNamesList.length +
                                    1,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: AppColors.offWhite2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.w),
                              child: CustomText(
                                text:
                                    'Featuring ${searchCubit.searchResultList.length} jobs',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.4,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (searchCubit.searchResultList.isNotEmpty) {
                          return JobPreviewCard(
                            jobModel: searchCubit.searchResultList[index],
                            saveOnPressed: () {
                              savedCubit.addToFavoritesInAPI(
                                token: AuthCubit.authorizationToken,
                                userID: authCubit.userModel.id!,
                                jobID: searchCubit.searchResultList[index].id!,
                              );
                            },
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppAssets.searchNotFoundImage,
                                    width: 50.w,
                                    height: 50.w,
                                  ),
                                  SizedBox(
                                    height: 3.w,
                                  ),
                                  const CustomText(
                                    text: AppStrings.searchNotFoundTitle,
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
                                    text: AppStrings.searchNotFoundSubTitle,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    color: AppColors.grey,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                      },
                      childCount: searchCubit.searchResultList.isEmpty
                          ? 1
                          : searchCubit.searchResultList.length,
                    ),
                  ),
                ],
              );
            } else if (state is LoadingSearchJobsListState) {
              return Center(
                child: SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.offWhite2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                      child: const CustomText(
                        text: 'Recent searches',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        7,
                        (index) => const SearchJobPreview(
                          prefixIcon: AppAssets.clockIcon,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.offWhite2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
                      child: const CustomText(
                        text: 'Popular searches',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        7,
                        (index) => const SearchJobPreview(
                          prefixIcon: AppAssets.searchStatusIcon,
                          suffixIcon: Icons.arrow_circle_right_outlined,
                          suffixIconColor: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
