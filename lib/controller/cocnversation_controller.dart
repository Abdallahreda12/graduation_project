
import 'package:get/get.dart';

import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/models/conversation_model.dart';
import 'package:graduation_project/data/service/remote/chat_data.dart';
import 'package:graduation_project/data/service/remote/websocket_service.dart';

class ConversationsController extends GetxController {
  List<Conversation> conversations = [];
  bool isLoading = false;
  String errorMessage = '';
  int currentUserId = 0;
  
  final WebSocketService _webSocketService = WebSocketService();

  @override
  void onInit() {
    super.onInit();
    
    // Get current user ID from MyServices
    MyServices myServices = Get.find();
    currentUserId = myServices.sharedPreferences.getInt("id") ?? 0;
    currentUserId = 2 ; ////////////////////////////////////////////////
    _setupWebSocket();
    loadConversations();
  }

  void _setupWebSocket() {
    _webSocketService.connect();
    _webSocketService.authenticate(currentUserId);
    
    _webSocketService.onMessageReceived = (messageData) {
      // Update last message in conversation
      final conversationId = messageData['conversation_id'];
      final index = conversations.indexWhere((c) => c.conversationId == conversationId);
      if (index != -1) {
        loadConversations(); // Refresh conversations to get updated data
      }
    };

    _webSocketService.onStatusChanged = (userId, status) {
      // Handle user status changes if needed
      update();
    };
  }

  Future<void> loadConversations() async {
    try {
      isLoading = true;
      errorMessage = '';
      update();

      final response = await ApiService.getConversations(currentUserId);
      
      if (response['status'] == 'success') {
        conversations = (response['data'] as List)
            .map((item) => Conversation.fromJson(item))
            .toList();
            print(response['data']) ;
        errorMessage = '';
      } else {
        errorMessage = 'Failed to load conversations';
        conversations = [];
      }
    } catch (e) {
      errorMessage = 'Error loading conversations: $e';
      conversations = [];
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> createConversation(int userId1, int userId2) async {
    try {
      final response = await ApiService.createConversation(userId1, userId2);
      
      if (response['status'] == 'success') {
        loadConversations(); // Refresh the list
      } else {
        errorMessage = 'Failed to create conversation';
        update();
      }
    } catch (e) {
      errorMessage = 'Error creating conversation: $e';
      update();
    }
  }

  @override
  void onClose() {
    _webSocketService.disconnect();
    super.onClose();
  }
}
