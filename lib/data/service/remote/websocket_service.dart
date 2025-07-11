import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketService {
  static const String wsUrl = 'ws://192.168.1.6:9090';
  
  WebSocketChannel? _channel;
  Function(Map<String, dynamic>)? onMessageReceived;
  Function(int, String)? onStatusChanged;
  Function(int, int, bool)? onTypingIndicator;
  Function(int, int)? onMessageRead;

  void connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      _channel!.stream.listen(
        (message) {
        //  print(message) ; ///////////////////////////////////////////////////
          final data = json.decode(message);
          _handleMessage(data);
        },
        onError: (error) {
          print('WebSocket error: $error');
        },
        onDone: () {
          print('WebSocket connection closed');
        },
      );
    } catch (e) {
      print('Failed to connect to WebSocket: $e');
    }
  }

  void _handleMessage(Map<String, dynamic> data) {
    switch (data['action']) {
      case 'new_message':
        onMessageReceived?.call(data['message']);
        break;
      case 'user_status':
        onStatusChanged?.call(data['user_id'], data['status']);
        break;
      case 'typing_indicator':
        onTypingIndicator?.call(data['user_id'], data['conversation_id'], data['is_typing']);
        break;
      case 'message_read':
        onMessageRead?.call(data['reader_id'], data['message_id']);
        break;
    }
  }

  void authenticate(int userId) {
    _send({
      'action': 'auth',
      'user_id': userId,
    });
  }

  void sendMessage(int conversationId, String messageContent) {
    _send({
      'action': 'message',
      'conversation_id': conversationId,
      'message_content': messageContent,
    });
  }

  void updateStatus(String status) {
    _send({
      'action': 'status',
      'status': status,
    });
  }

  void markMessagesRead(List<int> messageIds) {
    _send({
      'action': 'mark_read',
      'message_ids': messageIds,
    });
  }

  void sendTypingIndicator(int conversationId, bool isTyping) {
    _send({
      'action': 'typing',
      'conversation_id': conversationId,
      'is_typing': isTyping,
    });
  }

  void _send(Map<String, dynamic> data) {
    if (_channel != null) {
      _channel!.sink.add(json.encode(data));
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}