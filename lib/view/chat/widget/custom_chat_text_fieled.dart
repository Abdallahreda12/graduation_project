
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/cocnversation_controller.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomChatTextField extends StatefulWidget {
  const CustomChatTextField({super.key});

  @override
  State<CustomChatTextField> createState() => _CustomChatTextFieldState();
}

class _CustomChatTextFieldState extends State<CustomChatTextField> {
  final TextEditingController _messageController = TextEditingController();
  final ConversationController _conversationController = Get.find();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      _conversationController.sendMessage(message);
      _messageController.clear();
      _conversationController.onTypingStopped();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              cursorColor: ColorsApp.primaryColor,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.send,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _conversationController.onTypingStarted();
                } else {
                  _conversationController.onTypingStopped();
                }
              },
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: ColorsApp.primaryColor,
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}