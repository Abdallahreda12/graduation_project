// models/message.dart
class Message {
  final int messageId;
  final int senderId;
  final int conversationId;
  final String messageContent;
  final int isRead;
  final String createdAt;

  Message({
    required this.messageId,
    required this.senderId,
    required this.conversationId,
    required this.messageContent,
    required this.isRead,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: int.parse(json['message_id'].toString()),
      senderId: int.parse(json['sender_id'].toString()),
      conversationId: int.parse(json['conversation_id'].toString()),
      messageContent: json['message_content'] ?? '',
      isRead: int.parse(json['is_read'].toString()),
      createdAt: json['created_at'] ?? '',
    );
  }
}