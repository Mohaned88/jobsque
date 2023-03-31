import 'package:jobsque/01_model/03_employee_model/employee_model.dart';
import 'package:jobsque/01_model/05_job_model/job_model.dart';
import 'package:jobsque/02_view/04_utilities/res/assets.dart';
import 'package:jobsque/02_view/04_utilities/res/strings.dart';

import '../../../01_model/02_country_model/country_model.dart';

class AppConstants {
  static List<CountryModel> countries = List.generate(
    13,
    (index) => CountryModel(
      id: index+1,
      countryName: AppStrings.countryNames[index],
      flag: AppAssets.countryFlags[index],
    ),
  );

  static List<EmployeeModel> employees = [
    EmployeeModel(
      id: 1,
      name: 'Dimas Adi Saputro',
      jobDegree: 'Senior',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 5,
      photo: AppAssets.countryFlags[6],
    ),
    EmployeeModel(
      id: 2,
      name: 'Syahrul Ramadhani',
      jobDegree: 'Senior',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 5,
      photo: AppAssets.countryFlags[1],
    ),
    EmployeeModel(
      id: 3,
      name: 'Farrel Daniswara',
      jobDegree: 'Senior',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 4,
      photo: AppAssets.countryFlags[2],
    ),
    EmployeeModel(
      id: 4,
      name: 'Azzahra Farrelika',
      jobDegree: '',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 4,
      photo: AppAssets.countryFlags[3],
    ),
    EmployeeModel(
      id: 5,
      name: 'Ferdi Saputra',
      jobDegree: '',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 5,
      photo: AppAssets.countryFlags[4],
    ),
    EmployeeModel(
      id: 6,
      name: 'Dimas Adi Saputro',
      jobDegree: 'Senior',
      jobTitle: 'UI/UX Designer',
      workCompany: 'Twitter',
      workDuring: 5,
      photo: AppAssets.countryFlags[5],
    ),
  ];

  static List<JobModel> suggestedJobs =[
    JobModel(
      id: 0,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 1,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 2,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 3,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 4,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 5,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 6,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
    JobModel(
      id: 7,
      image: AppAssets.twitterLogo,
      name: AppStrings.suggestedJobsTitle[0],
      salary: '12K-15K',
      types: AppStrings.suggestedJobsTypes,
      company: AppStrings.suggestedJobsCompanies[0],
      location: 'Indonesia',
      description: AppStrings.applyJobDescriptionSubTitle,
      skills: AppStrings.applyJobRequiredSkills[1],
      aboutCompany: AppStrings.applyJobCompanyAboutCompanySubTitle,
      companyMail: AppStrings.applyJobCompanyEmail,
      companyWebSite: AppStrings.applyJobCompanyWebSite,
    ),
  ];

  static const String loginLink = '134.209.132.80/api/auth/login?';
  static const String registerLink ='134.209.132.80/api/auth/register?';
  static const String workTypeLink ='134.209.132.80/api/user/profile/';
  static const String jobsLink = '134.209.132.80/api/jobs';
  static const String suggestJobsLink = '134.209.132.80/api/jobs/sugest/';
  static const String getChatLink = '134.209.132.80/api/chat?';
  static const String userSendLink = '134.209.132.80/api/chat/user?';
  static const String editProfileLanguageLink = '134.209.132.80/api/user/profile/language/';
  static const String searchJobsLink = '134.209.132.80/api/jobs/search?name=';
  static const String addToFavoritesLink = '134.209.132.80/api/favorites?';
  static const String showFavoritesFromAPILink = '134.209.132.80/api/favorites/';
}
