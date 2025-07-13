import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/models/massage_model.dart';
import 'package:graduation_project/data/service/remote/chat_data.dart';
import 'package:graduation_project/data/service/remote/websocket_service.dart';
import 'dart:async';

class ChatController extends GetxController {
  List<Message> messages = [];
  bool isLoading = false;
  String errorMessage = '';
  int currentUserId = 0;
  int conversationId = 0;
  int otherUserId = 0;
  String peerName = '';
  String photo = '';
  bool isTyping = false;
  bool peerIsTyping = false;
  String peerStatus = 'offline'; // online, offline, away
  DateTime? lastSeen;
  int limit = 20;
  int offset = 0;
  bool hasMoreMessages = true;
  bool isLoadingMore = false;
  
  // Track when the chat was first opened to control date separator behavior
  DateTime? chatOpenedAt;
  
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final WebSocketService _webSocketService = WebSocketService();
  
  Timer? _typingTimer;
  Timer? _statusTimer;

  @override
  void onInit() {
    super.onInit();
    
    // Record when the chat was opened
    chatOpenedAt = DateTime.now();
    
    // Get current user ID from MyServices
    MyServices myServices = Get.find();
    currentUserId = myServices.sharedPreferences.getInt("id")?? 0;
    //currentUserId = 1; // For testing
    
    // Get parameters from Get.arguments
    if (Get.arguments != null) {
      conversationId = Get.arguments['conversation_id'] ?? 0;
      otherUserId = Get.arguments['other_user_id'] ?? 0;
      peerName = Get.arguments['peer_name'] ?? '';
      photo = Get.arguments['photo'] ?? '';
    }
    
    //otherUserId = 2; // For testing
    
    _setupWebSocket();
    _setupScrollListener();
    
    // If conversationId is 0, we need to find or create conversation
    if (conversationId == 0 && otherUserId != 0) {
      findOrCreateConversation();
    } else {
      loadMessages();
    }
    
    // Update user status to online
    _webSocketService.updateStatus('online');
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= 
          scrollController.position.maxScrollExtent - 200) {
        if (!isLoadingMore && hasMoreMessages) {
          loadMoreMessages();
        }
      }
    });
  }

  void _setupWebSocket() {
    _webSocketService.connect();
    _webSocketService.authenticate(currentUserId);
    
    _webSocketService.onMessageReceived = (messageData) {
      print('New message received: $messageData');
      final message = Message.fromJson(messageData);
      
      if (message.conversationId == conversationId) {
        // Check if this is a message we sent (replace optimistic message)
        if (message.senderId == currentUserId) {
          // Find and remove the optimistic message
          final pendingMessage = pendingMessages[message.messageContent];
          if (pendingMessage != null) {
            // Remove the optimistic message
            messages.removeWhere((m) => m.messageId == pendingMessage.messageId);
            pendingMessages.remove(message.messageContent);
          }
        }
        
        // Add the real message from server
        messages.insert(0, message);
        
        // Mark message as read if it's not from current user
        if (message.senderId != currentUserId) {
          _webSocketService.markMessagesRead([message.messageId]);
          _showIncomingMessageAnimation();
        }
        
        update();
        _scrollToBottom();
      }
    };

    _webSocketService.onStatusChanged = (userId, status) {
      if (userId == otherUserId) {
        peerStatus = status;
        if (status == 'offline') {
          lastSeen = DateTime.now();
        }
        update();
      }
    };

    _webSocketService.onTypingIndicator = (userId, convId, typing) {
      if (convId == conversationId && userId == otherUserId) {
        peerIsTyping = typing;
        update();
        
        if (typing) {
          // Auto-hide typing indicator after 3 seconds
          Timer(Duration(seconds: 3), () {
            if (peerIsTyping) {
              peerIsTyping = false;
              update();
            }
          });
        }
      }
    };

    _webSocketService.onMessageRead = (readerId, messageId) {
      if (readerId == otherUserId) {
        final index = messages.indexWhere((m) => m.messageId == messageId);
        if (index != -1) {
          final oldMessage = messages[index];
          messages[index] = Message(
            messageId: oldMessage.messageId,
            senderId: oldMessage.senderId,
            conversationId: oldMessage.conversationId,
            messageContent: oldMessage.messageContent,
            isRead: 1,
            createdAt: oldMessage.createdAt,
          );
          update();
        }
      }
    };
  }

  void _showIncomingMessageAnimation() {
    // Add subtle animation or sound notification
    // This could trigger a gentle vibration or sound
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> findOrCreateConversation() async {
    try {
      isLoading = true;
      errorMessage = '';
      update();

      final response = await ApiService.createConversation(currentUserId, otherUserId);
      
      if (response['status'] == 'success') {
        conversationId = response['conversation_id'];
        loadMessages();
      } else {
        errorMessage = 'Failed to create conversation';
        isLoading = false;
        update();
      }
    } catch (e) {
      errorMessage = 'Error finding/creating conversation: $e';
      isLoading = false;
      update();
    }
  }

  Future<void> loadMessages() async {
    try {
      if (offset == 0) {
        isLoading = true;
      }
      errorMessage = '';
      update();

      final response = await ApiService.getMessages(conversationId, limit, offset);
       
      if (response['status'] == 'success') {
        final newMessages = (response['data'] as List)
            .map((item) => Message.fromJson(item))
            .toList();
        
        if (offset == 0) {
          messages = newMessages;
          _scrollToBottom();
        } else {
          messages.addAll(newMessages);
        }
        
        // Check if there are more messages
        hasMoreMessages = newMessages.length == limit;
        
        errorMessage = '';
        
        // Mark unread messages as read
        final unreadMessages = messages
            .where((m) => m.senderId != currentUserId && m.isRead == 0)
            .map((m) => m.messageId)
            .toList();
        
        if (unreadMessages.isNotEmpty) {
          _webSocketService.markMessagesRead(unreadMessages);
        }
      } else {
        // if (offset == 0) {
        //   errorMessage = 'Failed to load messages';
        // }
      }
    } catch (e) {
      errorMessage = 'Error loading messages: $e';
    } finally {
      isLoading = false;
      isLoadingMore = false;
      update();
    }
  }

  Future<void> loadMoreMessages() async {
    if (isLoadingMore || !hasMoreMessages) return;
    
    isLoadingMore = true;
    update();
    
    offset += limit;
    await loadMessages();
  }

  Future<void> refreshMessages() async {
    offset = 0;
    await loadMessages();
  }

  // Map to track pending messages
  Map<String, Message> pendingMessages = {};

  get webViewController => null;

  void sendMessage() {
    final content = messageController.text.trim();
    if (content.isNotEmpty && conversationId != 0) {
      // Create a unique temporary ID for this message
      final tempId = 'temp_${DateTime.now().millisecondsSinceEpoch}';
      
      // Create optimistic message with current timestamp
      final optimisticMessage = Message(
        messageId: tempId.hashCode, // Use hashCode of tempId as temporary ID
        senderId: currentUserId,
        conversationId: conversationId,
        messageContent: content,
        isRead: 0,
        createdAt: DateTime.now().toIso8601String(),
      );
      
      // Add to pending messages map
      pendingMessages[content] = optimisticMessage;
      
      messages.insert(0, optimisticMessage);
      messageController.clear();
      update();
      
      // Send via WebSocket
      _webSocketService.sendMessage(conversationId, content);
      
      // Stop typing indicator
      if (isTyping) {
        _webSocketService.sendTypingIndicator(conversationId, false);
        isTyping = false;
        _typingTimer?.cancel();
      }
      
      _scrollToBottom();
    }
  }

  void onTyping() {
    if (!isTyping) {
      isTyping = true;
      _webSocketService.sendTypingIndicator(conversationId, true);
      update();
    }
    
    // Reset typing timer
    _typingTimer?.cancel();
    _typingTimer = Timer(Duration(seconds: 2), () {
      onStopTyping();
    });
  }

  void onStopTyping() {
    if (isTyping) {
      isTyping = false;
      _webSocketService.sendTypingIndicator(conversationId, false);
      update();
    }
    _typingTimer?.cancel();
  }

  String getPeerStatusText() {
    switch (peerStatus) {
      case 'online':
        return 'Online';
      case 'away':
        return 'Away';
      case 'offline':
        if (lastSeen != null) {
          final now = DateTime.now();
          final difference = now.difference(lastSeen!);
          if (difference.inMinutes < 1) {
            return 'Last seen just now';
          } else if (difference.inMinutes < 60) {
            return 'Last seen ${difference.inMinutes}m ago';
          } else if (difference.inHours < 24) {
            return 'Last seen ${difference.inHours}h ago';
          } else {
            return 'Last seen ${difference.inDays}d ago';
          }
        }
        return 'Offline';
      default:
        return '';
    }
  }

  Color getPeerStatusColor() {
    switch (peerStatus) {
      case 'online':
        return Colors.green;
      case 'away':
        return Colors.orange;
      case 'offline':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Helper method to check if a message should show a date separator
  bool shouldShowDateSeparator(int index) {
    if (messages.isEmpty || index < 0 || index >= messages.length) return false;
    
    try {
      final currentMessageDate = DateTime.parse(messages[index].createdAt);
      
      // Always show date for the last message (oldest message at bottom)
      if (index == messages.length - 1) {
        return true;
      }
      
      // Show date if this message is from a different day than the previous message
      final previousMessageDate = DateTime.parse(messages[index + 1].createdAt);
      
      return !_isSameDay(currentMessageDate, previousMessageDate);
    } catch (e) {
      return false;
    }
  }

  // Helper method to check if two dates are the same day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    _typingTimer?.cancel();
    _statusTimer?.cancel();
    
    // Update status to offline before disconnecting
    _webSocketService.updateStatus('offline');
    _webSocketService.disconnect();
    
    super.onClose();
  }
}