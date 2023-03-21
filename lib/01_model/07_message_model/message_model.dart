class MessageModel{

  final int? id;
  final String? message;
  final int? userID;
  final int? compID;
  final String? senderUser;
  final String? createdAt;

  const MessageModel({
    this.id,
    this.message,
    this.userID,
    this.compID,
    this.senderUser,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    Map<String,dynamic> data = {};

    data['id'] = id;
    data['massage'] = message;
    data['user_id'] = userID;
    data['comp_id'] = compID;
    data['sender_user'] = senderUser;
    data ['created_at'] = createdAt;

   return data;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      message: map['massage'],
      userID: map['user_id'],
      compID: map['comp_id'],
      senderUser: map['sender_user'],
      createdAt: map['created_at'],
    );
  }
}