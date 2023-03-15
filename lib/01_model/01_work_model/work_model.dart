class WorkTypeModel {
  final String? title;
  final String? photo;

  WorkTypeModel({
    this.title,
    this.photo,
  });

  Map<String, dynamic> toMap() {

    Map<String,dynamic> data = {};

    data['title'] = title;
    data['photo'] = photo;

    return data;
  }

  factory WorkTypeModel.fromMap(Map<String, dynamic> map) {
    return WorkTypeModel(
      title: map['title'] as String,
      photo: map['photo'] as String,
    );
  }
}
