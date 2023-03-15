class MessageModel{

  final int? id;
  final String? senderID;
  final String? receiverID;
  final String? date;
  final String? time;
  final String? message;
  final String? senderName;

  const MessageModel({
    this.id,
    this.senderID,
    this.receiverID,
    this.date,
    this.time,
    this.message,
    this.senderName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderID': senderID,
      'receiverID': receiverID,
      'date': date,
      'time': time,
      'message': message,
      'senderName': senderName,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      senderID: map['senderID'] as String,
      receiverID: map['receiverID'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      message: map['message'] as String,
      senderName: map['senderName'] as String,
    );
  }
}