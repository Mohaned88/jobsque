class JobModel{
  final int? id;
  final String? photo;
  final String? title;
  final List<String>? types;
  final String? minSalary;
  final String? maxSalary;
  final String? company;
  final String? country;
  final String? city;
  final String? description;
  final List<String>? skills;
  final String? companyMail;
  final String? companyWebSite;
  final String? aboutCompany;

  const JobModel({
    this.id,
    this.photo,
    this.title,
    this.types,
    this.minSalary,
    this.maxSalary,
    this.company,
    this.country,
    this.city,
    this.description,
    this.skills,
    this.companyMail,
    this.companyWebSite,
    this.aboutCompany,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'title': title,
      'types': types,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
      'company': company,
      'country': country,
      'city': city,
      'description': description,
      'skills': skills,
      'companyMail': companyMail,
      'companyWebSite': companyWebSite,
      'aboutCompany': aboutCompany,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] as int,
      photo: map['photo'] as String,
      title: map['title'] as String,
      types: map['types'] as List<String>,
      minSalary: map['minSalary'] as String,
      maxSalary: map['maxSalary'] as String,
      company: map['company'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      description: map['description'] as String,
      skills: map['skills'] as List<String>,
      companyMail: map['companyMail'] as String,
      companyWebSite: map['companyWebSite'] as String,
      aboutCompany: map['aboutCompany'] as String,
    );
  }
}