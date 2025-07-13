import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:graduation_project/controller/ai_chat_controller.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiChatController>(
      init: AiChatController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'AI Chat Assistant',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: const Color(0xFF1976D2),
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: controller.refreshWebchat,
                tooltip: 'Refresh Chat',
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  switch (value) {
                    case 'open':
                      controller.openWebchat();
                      break;
                    case 'close':
                      controller.closeWebchat();
                      break;
                    case 'reset':
                      _showResetDialog(context, controller);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'open',
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        SizedBox(width: 8),
                        Text('Open Chat'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'close',
                    child: Row(
                      children: [
                        Icon(Icons.close),
                        SizedBox(width: 8),
                        Text('Close Chat'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'reset',
                    child: Row(
                      children: [
                        Icon(Icons.restart_alt),
                        SizedBox(width: 8),
                        Text('Reset Chat'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Column(
            children: [
              // WebView Container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // WebView
                      controller.isWebViewReady && controller.webViewController != null
                          ? WebViewWidget(
                              controller: controller.webViewController!,
                            )
                          : Container(
                              color: Colors.grey.shade50,
                              child: const Center(
                                child: Text(
                                  'Preparing chat...',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                      
                      // Loading Overlay
                      if (controller.isLoading)
                        Container(
                          color: Colors.white.withOpacity(0.8),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF1976D2),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Loading AI Chat...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              
              // Message Input Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      // Message Input Field
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: TextField(
                            controller: controller.messageController,
                            decoration: const InputDecoration(
                              hintText: 'Type your message...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            maxLines: null,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => controller.sendMessage(),
                            enabled: controller.isWebViewReady,
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 12),
                      
                      // Send Button
                      GestureDetector(
                        onTap: controller.isWebViewReady && 
                               controller.messageController.text.trim().isNotEmpty
                            ? controller.sendMessage
                            : null,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: controller.isWebViewReady && 
                                   controller.messageController.text.trim().isNotEmpty
                                ? const Color(0xFF1976D2)
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showResetDialog(BuildContext context, AiChatController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset Chat'),
          content: const Text(
            'Are you sure you want to reset the chat? This will clear all conversation history.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.resetWebchat();
              },
              child: const Text(
                'Reset',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}