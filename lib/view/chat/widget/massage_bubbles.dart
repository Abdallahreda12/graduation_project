import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class MessageBubble extends StatelessWidget {
  // final Message message;
  final bool isMe;

  const MessageBubble({
    Key? key,
    // required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: isMe ? 80 : 0,
        right: isMe ? 0 : 80,
      ),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isMe ? ColorsApp.primaryColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "hello omar",
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "1.45 ص" ,
                      //" _formatMessageTime()",
                      style: TextStyle(
                        fontSize: 10,
                        color: isMe ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    if (isMe) SizedBox(width: 4),
                    if (isMe)
                      Icon(
                        true // message.isRead
                            ? Icons.done_all
                            : Icons.done,
                        size: 14,
                        color:
                            //message.isRead
                            true ? Colors.white : Colors.white70,
                      ),
                    // if (message.isPending)
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 4),
                    //     child: SizedBox(
                    //       width: 10,
                    //       height: 10,
                    //       child: CircularProgressIndicator(
                    //         strokeWidth: 2,
                    //         color: isMe ? Colors.white : Colors.blue,
                    //       ),
                    //     ),
                    //   ),
                    // if (message.isFailed)
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 4),
                    //     child: Icon(
                    //       Icons.error_outline,
                    //       size: 14,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
