import 'package:flutter/material.dart';
import 'package:graduation_project/view/chat/widget/chat_app_bar.dart';
import 'package:graduation_project/view/chat/widget/custom_chat_text_fieled.dart';
import 'package:graduation_project/view/chat/widget/massage_bubbles.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      ChatAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) =>  Column(
                children: [
                  MessageBubble(isMe: true,)
                ],
              ),
            )),
           CustomChatTextFieled()
          ],
        ),
      ),
    );
  }
}
