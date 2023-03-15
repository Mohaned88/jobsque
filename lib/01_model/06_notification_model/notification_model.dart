class NotificationModel{
  final int? id;
  final String? title;
  final String? logo;
  final String? description;
  final String? time;
  final String? date;

  const NotificationModel({
    this.id,
    this.title,
    this.logo,
    this.description,
    this.time,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'logo': logo,
      'description': description,
      'time': time,
      'date': date,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      title: map['title'] as String,
      logo: map['logo'] as String,
      description: map['description'] as String,
      time: map['time'] as String,
      date: map['date'] as String,
    );
  }
}