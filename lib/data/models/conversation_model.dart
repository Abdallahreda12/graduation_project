// models/conversation.dart
class Conversation {
  final int conversationId;
  final int user2Id;
  final String peerName;
  final String? photo;
  final String? lastMessage;
  final String? lastAt;
  final int? lastRead;
  final int unreadCount;

  Conversation({
    required this.conversationId,
    required this.user2Id,
    required this.peerName,
    this.photo,
    this.lastMessage,
    this.lastAt,
    this.lastRead,
    required this.unreadCount,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      conversationId: int.parse(json['conversation_id'].toString()),
      user2Id: int.parse(json['user2_id'].toString()),
      peerName: json['peer_name'] ?? '',
      photo: json['photo'],
      lastMessage: json['last_message'],
      lastAt: json['last_at'],
      lastRead: json['last_read'] != null ? int.parse(json['last_read'].toString()) : null,
      unreadCount: int.parse(json['unread_count'].toString()),
    );
  }
}