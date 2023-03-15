class FileModel {
  String? name;
  String? type;
  String? size;
  String? photo;

  FileModel({
    this.name,
    this.type,
    this.size,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'size': size,
      'photo': photo,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      name: map['name'] as String,
      type: map['type'] as String,
      size: map['size'] as String,
      photo: map['photo'] as String,
    );
  }
}
