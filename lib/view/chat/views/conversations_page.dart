import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/cocnversation_controller.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project/view/chat/views/chat_page.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: GetBuilder<ConversationsController>(
        init: ConversationsController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
                    strokeWidth: 5,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading your conversations...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    controller.errorMessage,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red[600],
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => controller.loadConversations(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Retry',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }

          if (controller.conversations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No conversations yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connect with others to start chatting!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: ColorsApp.primaryColor,
            backgroundColor: Colors.white,
            onRefresh: () => controller.loadConversations(),
            child: ListView.builder(
              itemCount: controller.conversations.length,
              itemBuilder: (context, index) {
                final conversation = controller.conversations[index];

                // Format lastAt timestamp
                String formattedTime = conversation.lastAt ?? 'No time';
                if (conversation.lastAt != null) {
                  try {
                    final dateTime = DateTime.parse(conversation.lastAt!);
                    formattedTime =
                        DateFormat('h:mm a').format(dateTime.toLocal());
                  } catch (e) {
                    formattedTime = conversation.lastAt!;
                  }
                }

                // Determine last message sender
                final isLastMessageFromMe =
                    conversation.user2Id == controller.currentUserId;
                final lastMessageText = conversation.lastMessage != null
                    ? conversation.lastMessage!
                    : 'No messages yet';

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: ColorsApp.primaryColor.withOpacity(0.2),
                      backgroundImage: (conversation.photo != null &&
                              conversation.photo!.isNotEmpty &&
                              conversation.photo! != "empty")
                          ? NetworkImage("$linkServerImage/${conversation.photo}")
                          : null,
                      child: (conversation.photo == null ||
                              conversation.photo == "empty")
                          ? Text(
                              conversation.peerName.isNotEmpty
                                  ? conversation.peerName[0].toUpperCase()
                                  : 'U',
                              style: TextStyle(
                                color: ColorsApp.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          : null,
                    ),
                    title: Text(
                      conversation.peerName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        // Visual indicator for message sender
                        if (conversation.lastMessage != null) ...[
                         Icon(
  isLastMessageFromMe 
      ? Icons.arrow_forward_ios  // رسائلك
      : Icons.arrow_back_ios,    // رسائلهم
  size: 14,
  color: isLastMessageFromMe 
      ? ColorsApp.primaryColor
      : Colors.grey[600],
),
                          const SizedBox(width: 4),
                        ],
                        Expanded(
                          child: Text(
                            lastMessageText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: isLastMessageFromMe
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Multiple visual indicators
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Message status indicator for your messages
                            if (conversation.lastMessage != null && isLastMessageFromMe) ...[
                              Icon(
                                Icons.done_all,  // Double check mark (you can change this based on read status)
                                size: 14,
                                color: Colors.grey[500],  // You can make this blue if message is read
                              ),
                              const SizedBox(width: 8),
                            ],
                            // Unread count badge
                            if (conversation.unreadCount > 0)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  conversation.unreadCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(
                        () => const ChatPage(),
                        arguments: {
                          'conversation_id': conversation.conversationId,
                          'other_user_id': conversation.user2Id,
                          'peer_name': conversation.peerName,
                          "photo" : conversation.photo ,
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}