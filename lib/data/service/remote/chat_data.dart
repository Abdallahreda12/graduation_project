import 'package:graduation_project/api_links.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl =  linkChat ;
  //"http://10.0.2.2s/help_animals/chat"; 
  //"http://192.168.1.6/help_animals/chat" ;
  //'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/chat';

  static Future<Map<String, dynamic>> createConversation(int userId1, int userId2) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/create_conversation.php'),
      //  headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'userId1': userId1.toString(),
          'userId2': userId2.toString(),
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create conversation');
      }
    } catch (e) {
      throw Exception('Error creating conversation: $e');
    }
  }

  static Future<Map<String, dynamic>> getConversations(int userId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_conversations.php'),
      //  headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'userId': userId.toString(),
        },
      );
       print(response.body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get conversations');
      }
    } catch (e) {
      throw Exception('Error getting conversations: $e');
    }
  }

  static Future<Map<String, dynamic>> getMessages(int conversationId, int limit, int offset) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/get_messages.php'),
     //   headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'conversation_id': conversationId.toString(),
          'limit': limit.toString(),
          'offset': offset.toString(),
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get messages');
      }
    } catch (e) {
      throw Exception('Error getting messages: $e');
    }
  }

  static Future<Map<String, dynamic>> markMessagesRead(int senderId, int conversationId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/mark_messages_read.php'),
      //  headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'sender_id': senderId.toString(),
          'conversation_id': conversationId.toString(),
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to mark messages as read');
      }
    } catch (e) {
      throw Exception('Error marking messages as read: $e');
    }
  }
}
