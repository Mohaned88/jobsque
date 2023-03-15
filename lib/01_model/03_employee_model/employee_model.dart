class EmployeeModel {

  final int? id;
  final String? name;
  final String? jobDegree;
  final String? jobTitle;
  final String? workCompany;
  final String? photo;
  final int? workDuring;


  EmployeeModel({
    this.id,
    this.name,
    this.jobDegree,
    this.jobTitle,
    this.workDuring,
    this.photo,
    this.workCompany,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['jobDegree'] = jobDegree;
    data['jobTitle'] = jobTitle;
    data['workDuring'] = workDuring;
    data['photo'] = photo;
    data['workCompany'] = workCompany;
    return data;
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      jobDegree: map['jobDegree'] as String,
      jobTitle: map['jobTitle'] as String,
      workCompany: map['workCompany'] as String,
      photo: map['photo'] as String,
      workDuring: map['workDuring'] as int,
    );
  }
}
