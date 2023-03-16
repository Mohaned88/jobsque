class UserModel {
  int? id;
  String? email;
  String? name;
  String? password;
  String? photo;
  String? mobile;
  String? address;
  String? language;
  List<String>? interestedWork;
  List<String>? offlinePlace;
  List<String>? remotePlace;
  String? bio;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.password,
    this.photo,
    this.mobile,
    this.address,
    this.language,
    this.interestedWork,
    this.offlinePlace,
    this.remotePlace,
    this.bio,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['data']['id'] = id;
    map['data']['email'] = email;
    map['data']['name'] = name;
    map['data']['password'] = password;
    map['data']['personal detailes']['photo'] = photo;
    map['data']['mobile'] = mobile;
    map['data']['address'] = address;
    map['data']['language'] = language;
    map['data']['intersted_work'] = interestedWork;
    map['data']['offline_place'] = offlinePlace;
    map['data']['remote_place'] = remotePlace;
    map['data']['bio'] = bio;

    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['data']['id'] as int,
      email: map['data']['email'] as String,
      name: map['data']['name'] as String,
      password: map['data']['password'] as String,
      photo: map['data']['personal detailes']['photo'] as String,
      mobile: map['data']['mobile'] as String,
      address: map['data']['address'] as String,
      language: map['data']['language'] as String,
      interestedWork: map['data']['intersted_work'] as List<String>,
      offlinePlace: map['data']['offline_place'] as List<String>,
      remotePlace: map['data']['remote_place'] as List<String>,
      bio: map['data']['bio'] as String,
    );
  }
}
