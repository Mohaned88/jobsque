import 'package:jobsque/02_view/04_utilities/res/assets.dart';

class JobModel {
  int? id;
  int? jobId;
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
  String? createdAt;

  JobModel({
    this.id,
    this.jobId,
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
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};

    data['data']['id'] = id;
    data['data']['job_id'] = jobId;
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
    data['data']['created_at'] = createdAt;

    return data;
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    //var data = map['data'];
    return JobModel(
      id: map['id'],
      jobId: map['job_id'],
      name: map['name'],
      image: map['image'] ?? AppAssets.twitterLogo,
      types: [map['job_time_type'],map['job_type'],map['job_level']]??['1','2','3'],
      description: map['job_description'],
      skills: map['job_skill'],
      company: map['comp_name'],
      companyMail: map['comp_email'],
      companyWebSite: map['comp_website'],
      aboutCompany: map['about_comp'],
      location: map['location'],
      salary: map['salary'],
      expired: map['expired'],
      favorites: map['favorites'],
      createdAt: map['created_at'],
    );
  }
}
