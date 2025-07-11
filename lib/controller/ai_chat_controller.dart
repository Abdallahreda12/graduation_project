import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AiChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  WebViewController? webViewController; // Make it nullable
  bool isLoading = true;
  bool isWebViewReady = false;
  
  // Botpress webchat URL
  String botpressWebchatUrl = 'https://cdn.botpress.cloud/webchat/v2.2/shareable.html?configUrl=https://files.bpcontent.cloud/2025/02/22/23/20250222234440-3V5ZGK26.json';
  
  @override
  void onInit() {
    super.onInit();
    initializeWebView();
  }
  
  void initializeWebView() {
    try {
      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading progress if needed
              print('WebView loading progress: $progress%');
            },
            onPageStarted: (String url) {
              isLoading = true;
              isWebViewReady = false;
              update();
              print('WebView started loading: $url');
            },
            onPageFinished: (String url) {
              isLoading = false;
              isWebViewReady = true;
              update();
              print('WebView finished loading: $url');
              
              // Inject CSS to customize the webchat appearance
              _injectCustomStyles();
              
              // Wait a bit for the webchat to fully initialize
              Future.delayed(const Duration(seconds: 2), () {
                _setupWebchatListeners();
              });
            },
            onWebResourceError: (WebResourceError error) {
              print('WebView resource error: ${error.description}');
              isLoading = false;
              update();
            },
            onNavigationRequest: (NavigationRequest request) {
              // Allow all navigation for the webchat
              return NavigationDecision.navigate;
            },
          ),
        )
        ..addJavaScriptChannel(
          'FlutterWebView',
          onMessageReceived: (JavaScriptMessage message) {
            print('Message from WebView: ${message.message}');
          },
        )
        ..loadRequest(Uri.parse(botpressWebchatUrl));
    } catch (e) {
      print('Error initializing WebView: $e');
      isLoading = false;
      update();
    }
  }
  
  void _injectCustomStyles() {
    if (webViewController == null) return;
    
    // Inject custom CSS to style the webchat
    webViewController!.runJavaScript('''
      // Wait for the webchat to load
      function waitForWebchat() {
        try {
          if (typeof window.botpressWebChat !== 'undefined') {
            // Webchat is loaded
            console.log('Botpress webchat loaded successfully');
            
            // Add custom styles
            const style = document.createElement('style');
            style.textContent = `
              body {
                margin: 0;
                padding: 0;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
              }
              
              #bp-web-widget {
                height: 100vh !important;
                width: 100% !important;
              }
              
              .bpw-layout {
                height: 100vh !important;
                border-radius: 0 !important;
                box-shadow: none !important;
              }
              
              .bpw-header {
                background-color: #1976d2 !important;
                color: white !important;
              }
              
              .bpw-chat-container {
                height: calc(100vh - 120px) !important;
              }
              
              .bpw-composer {
                border-top: 1px solid #e0e0e0 !important;
              }
            `;
            document.head.appendChild(style);
            
            // Auto-open the webchat
            if (window.botpressWebChat) {
              window.botpressWebChat.sendEvent({ type: 'show' });
            }
          } else {
            // Retry after 500ms
            setTimeout(waitForWebchat, 500);
          }
        } catch (error) {
          console.error('Error in waitForWebchat:', error);
          setTimeout(waitForWebchat, 1000);
        }
      }
      
      // Start waiting for webchat
      waitForWebchat();
    ''').catchError((error) {
      print('Error injecting custom styles: $error');
    });
  }
  
  void _setupWebchatListeners() {
    if (webViewController == null) return;
    
    // Set up JavaScript listeners for webchat events
    webViewController!.runJavaScript('''
      try {
        if (window.botpressWebChat) {
          // Listen for webchat events
          window.botpressWebChat.onEvent(function(event) {
            console.log('Webchat event:', event.type);
            
            if (event.type === 'webchat.opened') {
              console.log('Webchat opened');
            } else if (event.type === 'webchat.closed') {
              console.log('Webchat closed');
            } else if (event.type === 'message.received') {
              console.log('Message received:', event.data);
            }
          });
          
          // Ensure webchat is visible and opened
          window.botpressWebChat.sendEvent({ type: 'show' });
        }
      } catch (error) {
        console.error('Error setting up webchat listeners:', error);
      }
    ''').catchError((error) {
      print('Error setting up webchat listeners: $error');
    });
  }
  
  void sendMessage() {
    if (messageController.text.trim().isEmpty || !isWebViewReady || webViewController == null) {
      return;
    }
    
    String message = messageController.text.trim();
    
    // Escape quotes in the message to prevent JavaScript injection
    String escapedMessage = message.replaceAll('"', '\\"').replaceAll("'", "\\'");
    
    // Send message to the webchat using JavaScript
    webViewController!.runJavaScript('''
      try {
        if (window.botpressWebChat) {
          window.botpressWebChat.sendEvent({
            type: 'proactive-trigger',
            channel: 'web',
            payload: {
              text: "$escapedMessage"
            }
          });
          
          // Alternative method to send message
          setTimeout(function() {
            const inputElement = document.querySelector('.bpw-composer-input, input[placeholder*="Type"], textarea[placeholder*="Type"]');
            if (inputElement) {
              inputElement.value = "$escapedMessage";
              inputElement.dispatchEvent(new Event('input', { bubbles: true }));
              
              // Find and click send button
              const sendButton = document.querySelector('.bpw-send-button, button[title*="Send"], button[aria-label*="Send"]');
              if (sendButton) {
                sendButton.click();
              } else {
                // Try pressing Enter
                inputElement.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', keyCode: 13, bubbles: true }));
              }
            }
          }, 100);
        }
      } catch (error) {
        console.error('Error sending message:', error);
      }
    ''').catchError((error) {
      print('Error sending message: $error');
    });
    
    messageController.clear();
    update();
  }
  
  void refreshWebchat() {
    if (webViewController == null) {
      // If webViewController is null, reinitialize
      initializeWebView();
      return;
    }
    
    isLoading = true;
    isWebViewReady = false;
    update();
    
    webViewController!.reload().catchError((error) {
      print('Error refreshing webchat: $error');
      isLoading = false;
      update();
    });
  }
  
  void openWebchat() {
    if (isWebViewReady && webViewController != null) {
      webViewController!.runJavaScript('''
        try {
          if (window.botpressWebChat) {
            window.botpressWebChat.sendEvent({ type: 'show' });
          }
        } catch (error) {
          console.error('Error opening webchat:', error);
        }
      ''').catchError((error) {
        print('Error opening webchat: $error');
      });
    }
  }
  
  void closeWebchat() {
    if (isWebViewReady && webViewController != null) {
      webViewController!.runJavaScript('''
        try {
          if (window.botpressWebChat) {
            window.botpressWebChat.sendEvent({ type: 'hide' });
          }
        } catch (error) {
          console.error('Error closing webchat:', error);
        }
      ''').catchError((error) {
        print('Error closing webchat: $error');
      });
    }
  }
  
  void resetWebchat() {
    if (isWebViewReady && webViewController != null) {
      webViewController!.runJavaScript('''
        try {
          if (window.botpressWebChat) {
            // Clear conversation
            window.botpressWebChat.sendEvent({ type: 'reset' });
            
            // Reload the page
            location.reload();
          }
        } catch (error) {
          console.error('Error resetting webchat:', error);
        }
      ''').catchError((error) {
        print('Error resetting webchat: $error');
      });
    }
  }
  
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}