class MessageModel {
  int messageId;
  int senderId;
  int conversationId;
  String messageContent;
  bool isRead;
  DateTime createdAt;

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.conversationId,
    required this.messageContent,
    required this.isRead,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['message_id'] ?? 0,
      senderId: json['sender_id'] ?? 0,
      conversationId: json['conversation_id'] ?? 0,
      messageContent: json['message_content'] ?? '',
      isRead: json['is_read'] == 1 || json['is_read'] == true,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'sender_id': senderId,
      'conversation_id': conversationId,
      'message_content': messageContent,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

// user_states_model.dart
class UserStatesModel {
  String id;
  String status;

  UserStatesModel({
    required this.id,
    required this.status,
  });

  factory UserStatesModel.fromJson(dynamic userId, String status) {
    return UserStatesModel(
      id: userId.toString(),
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }
}
