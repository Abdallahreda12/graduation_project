import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/chat_controller.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/data/models/massage_model.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: GetBuilder<ChatController>(
        builder: (controller) {
          return Column(
            children: [
              // Messages area
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.errorMessage.isNotEmpty
                        ? _buildErrorView(controller)
                        : controller.messages.isEmpty
                            ? _buildEmptyView()
                            : _buildMessagesView(controller),
              ),
              
              // Typing indicator
              _buildTypingIndicator(controller),
              
              // Message input
              _buildMessageInput(controller),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      title: GetBuilder<ChatController>(
        builder: (controller) {
          return Row(
            children: [
              // Profile picture
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: controller.photo.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                         "$linkServerImage/${controller.photo}" ,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.person, color: Colors.grey[600]);
                          },
                        ),
                      )
                    : CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[300],
                        child: Text(
                          controller.peerName.isNotEmpty ? controller.peerName[0].toUpperCase() : 'U',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              
              const SizedBox(width: 12),
              
              // Name and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.peerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 8,
                    //       height: 8,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: controller.getPeerStatusColor(),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 6),
                    //     Text(
                    //       controller.getPeerStatusText(),
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey[600],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'refresh',
              child: Row(
                children: [
                  Icon(Icons.refresh),
                  SizedBox(width: 8),
                  Text('Refresh'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            final controller = Get.find<ChatController>();
            if (value == 'refresh') {
              controller.refreshMessages();
            }
          },
        ),
      ],
    );
  }

  Widget _buildErrorView(ChatController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
          ),
          const SizedBox(height: 16),
          Text(
            controller.errorMessage,
            style: TextStyle(
              fontSize: 16,
              color: Colors.red[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.refreshMessages(),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Retry',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Start your conversation',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Send a message to get started',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesView(ChatController controller) {
    return RefreshIndicator(
      color: ColorsApp.primaryColor,
      backgroundColor: Colors.white,
      onRefresh: controller.refreshMessages,
      child: ListView.builder(
        controller: controller.scrollController,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: controller.messages.length + (controller.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == controller.messages.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
                ),
              ),
            );
          }
          
          final message = controller.messages[index];
          final isMe = message.senderId == controller.currentUserId;
          final showDate = _shouldShowDate(controller.messages, index);
          
          return Column(
            children: [
              if (showDate) _buildDateSeparator(message.createdAt),
              _buildMessageBubble(message, isMe, controller),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDateSeparator(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp);
      final today = DateTime.now();
      final yesterday = today.subtract(Duration(days: 1));
      
      String dateText;
      if (dateTime.day == today.day && 
          dateTime.month == today.month && 
          dateTime.year == today.year) {
        dateText = 'Today';
      } else if (dateTime.day == yesterday.day && 
                 dateTime.month == yesterday.month && 
                 dateTime.year == yesterday.year) {
        dateText = 'Yesterday';
      } else {
        dateText = DateFormat('MMM dd, yyyy').format(dateTime);
      }
      
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                dateText,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  Widget _buildMessageBubble(Message message, bool isMe, ChatController controller) {
    String formattedTime;
    try {
      final dateTime = DateTime.parse(message.createdAt);
      formattedTime = DateFormat('h:mm a').format(dateTime.toLocal());
    } catch (e) {
      formattedTime = message.createdAt;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Get.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isMe ? ColorsApp.primaryColor : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isMe ? 20 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.messageContent,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black87,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                    Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        formattedTime,
                        style: TextStyle(
                          color: isMe ? Colors.white70 : Colors.grey[500],
                          fontSize: 11,
                        ),
                      ),
                      if (isMe) ...[
                        const SizedBox(width: 4),
                        Icon(
                          message.isRead == 1 ? Icons.done_all : Icons.done,
                          size: 14,
                          color: message.isRead == 1 ? Colors.white : Colors.white70,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(ChatController controller) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        if (!controller.peerIsTyping) return const SizedBox.shrink();
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTypingDot(),
                    const SizedBox(width: 4),
                    _buildTypingDot(),
                    const SizedBox(width: 4),
                    _buildTypingDot(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTypingDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildMessageInput(ChatController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        controller.onTyping();
                      } else {
                        controller.onStopTyping();
                      }
                    },
                    onSubmitted: (value) {
                      controller.sendMessage();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: controller.sendMessage,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fixed date separator logic
  bool _shouldShowDate(List<Message> messages, int index) {
    if (messages.isEmpty) return false;
    
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

  void _showClearChatDialog(ChatController controller) {
    Get.dialog(
      AlertDialog(
        title: const Text('Clear Chat'),
        content: const Text('Are you sure you want to clear all messages? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.messages.clear();
              controller.update();
              Get.back();
              Get.snackbar('Success', 'Chat cleared successfully');
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}