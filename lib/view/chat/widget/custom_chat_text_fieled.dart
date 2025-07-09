import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomChatTextFieled extends StatelessWidget {
  const CustomChatTextFieled({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                      // controller: _messageController,
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
                      onSubmitted: (_) => {
                        print("object"),
                        //  _sendMessage()
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: ColorsApp.primaryColor,
                    onPressed: () {
                        print("objectqqq");
                      //_sendMessage
                    },
                  ),
                ],
              ),
            );
  }
}