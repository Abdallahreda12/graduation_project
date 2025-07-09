class MessageModel {
  final int? messageId; // Null for pending messages
  final int senderId;
  final int conversationId;
  final String messageContent;
  bool isRead;
  bool isPending;
  bool isFailed;

  MessageModel({
    this.messageId,
    required this.senderId,
    required this.conversationId,
    required this.messageContent,
    this.isRead = false,
    this.isPending = false,
    this.isFailed = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['message_id'],
      senderId: json['sender_id'],
      conversationId: json['conversation_id'],
      messageContent: json['message_content'],
      isRead: json['is_read'] == 1 || json['is_read'] == true,
      isPending: json['is_pending'] == 1 || json['is_pending'] == true,
      isFailed: json['is_failed'] == 1 || json['is_failed'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'sender_id': senderId,
      'conversation_id': conversationId,
      'message_content': messageContent,
      'is_read': isRead ? 1 : 0,
      'is_pending': isPending ? 1 : 0,
      'is_failed': isFailed ? 1 : 0,
    };
  }
}