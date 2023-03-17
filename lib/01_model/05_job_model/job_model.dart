import 'package:jobsque/02_view/04_utilities/res/assets.dart';

class JobModel {
  int? id;
  String? name;
  String? image;
  List<String>? types;
  String? description;
  String? skills;
  String? company;
  String? companyMail;
  String? companyWebSite;
  String? aboutCompany;
  String? location;
  String? salary;
  int? favorites;
  int? expired;

  JobModel({
    this.id,
    this.name,
    this.image,
    this.types,
    this.description,
    this.skills,
    this.company,
    this.companyMail,
    this.companyWebSite,
    this.aboutCompany,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};

    data['data']['id'] = id;
    data['data']['name'] = name;
    data['data']['image'] = image;
    data['data']['job_time_type'] = types![0];
    data['data']['job_type'] = types![1];
    data['data']['job_level'] = types![2];
    data['data']['job_description'] = description;
    data['data']['job_skill'] = skills;
    data['data']['comp_name'] = company;
    data['data']['comp_email'] = companyMail;
    data['data']['comp_website'] = companyWebSite;
    data['data']['about_comp'] = aboutCompany;
    data['data']['location'] = location;
    data['data']['salary'] = salary;
    data['data']['expired'] = expired;
    data['data']['favorites'] = favorites;

    return data;
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    var data = map['data'];
    return JobModel(
      id: data['id'] as int,
      name: data['name'] as String,
      image: data['image'] == null ? AppAssets.twitterLogo :data['image'] as String ,
      types: [data['job_time_type'],data['job_type'],data['job_level']] as List<String>,
      description: data['job_description'] as String,
      skills: data['job_skill'] as String,
      company: data['comp_name'] as String,
      companyMail: data['comp_email'] as String,
      companyWebSite: data['comp_website'] as String,
      aboutCompany: data['about_comp'] as String,
      location: data['location'] as String,
      salary: data['salary'] as String,
      expired: data['expired'],
      favorites: data['favorites'],
    );
  }
}
