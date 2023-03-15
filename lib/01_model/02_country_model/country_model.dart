class CountryModel {
  final int? id;
  final String? flag;
  final String? countryName;

  CountryModel({
    this.id,
    this.flag,
    this.countryName,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['flag'] = flag;
    data['countryName'] = countryName;

    return data;
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] as int,
      flag: map['flag'] as String,
      countryName: map['countryName'] as String,
    );
  }
}
