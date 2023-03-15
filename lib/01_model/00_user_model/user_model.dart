class UserModel {
  final int? id;
  final String? email;
  final String? name;
  final String? password;
  //final String? photo;

  const UserModel({
    this.id,
    this.email,
    this.name,
    this.password,
   // this.photo,
  });

  Map<String, dynamic> toMap(String tag) {
    Map<String, dynamic> map = {};

    map[tag]['id'] = id;
    map[tag]['email'] = email;
    map[tag]['name'] = name;
    map[tag]['password'] = password;
    //map[tag]['photo'] = photo;

    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map,String tag,String password) {
    return UserModel(
      id: map[tag]['id'] as int,
      email: map[tag]['email'] as String,
      name: map[tag]['name'] as String,
      password: password,
      //photo: map[tag]['photo'] as String,
    );
  }
}
