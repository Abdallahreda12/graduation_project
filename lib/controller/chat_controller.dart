import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/data/models/massage_model.dart';
import 'package:graduation_project/data/models/user_states_model.dart';
import 'package:graduation_project/data/service/remote/chat_data.dart';
import 'package:web_socket_channel/io.dart';

class ConversationController extends GetxController {
  late int userId;
  late int otherUserId;
  late String conversationId;
  late IOWebSocketChannel channel;
  ChatData chatData = ChatData() ;
  int offset = 0 ;
  bool isLoading = false ;
// This creates a StreamController that can:

// Receive a list of MessageModel messages

// Send that list to anything listening (like your UI).

// The .broadcast() part allows multiple listeners (like more than one widget).

// Think of it like a "microphone" that sends out message lists whenever something is added.

  final StreamController<List<MessageModel>> _messageStreamController =
//   👀 One UI screen listening to new messages

// 🔔 Another widget showing a notification badge
      StreamController<List<MessageModel>>.broadcast();

  List<MessageModel> messages = [];
  List<UserStatesModel> onlineUsers = [];
  
  late final StreamController<List<UserStatesModel>> statesStreemController ;

  @override
  void onInit() {
    super.onInit();
    statesStreemController = StreamController<List<UserStatesModel>>.broadcast();
    connectSocket();
  }

  Stream<List<MessageModel>> messageStream() {
    return _messageStreamController.stream;
  }
   Stream<List<UserStatesModel>> userStatesStreem() {
    return statesStreemController.stream;
  }

  void connectSocket() {
    channel = IOWebSocketChannel.connect('ws://10.0.2.2:9090');
    handleStreemListner() ;
   
  }

  void handleStreemListner(){
     channel.stream.listen((data) {
      final Map<String, dynamic> json = jsonDecode(data);

      switch (json['action']) {
        case 'new_message':
          final msg = MessageModel.fromJson(json['message']);
          messages.add(msg);
          //Sends the updated list to the UI when a new message arrives

          _messageStreamController.sink.add(messages);
          break;
         case 'user_status':
          UserStatesModel usersState = UserStatesModel.fromJson(json['user_id'] ,json['status'] );
          onlineUsers.add(usersState);
          if(otherUserId.toString() == usersState.id){
             statesStreemController.sink.add(onlineUsers);
          }
          
          break;
         case 'message_read':
          int index =  messages.indexWhere(
            (msg) => msg.messageId == json["message_id"]);
            messages[index].isRead = true ;
          _messageStreamController.sink.add(messages);
          break;

        // Handle other actions (status, typing, etc.) if needed
      }
    }, onError: (error) {
      print('Socket error: $error');
    }, onDone: () {
      print('WebSocket closed');
    });
  }

  void authenticate(int userId) {
    this.userId = userId;
    channel.sink.add(jsonEncode({
      'action': 'auth',
      'user_id': userId,
    }));
  }

  void sendMessage(String content) {
    channel.sink.add(jsonEncode({
      'action': 'message',
      'conversation_id': int.parse(conversationId),
      'message_content': content,
    }));
  }

  void markRead(List<int> messageIds) {
    channel.sink.add(jsonEncode({
      'action': 'mark_read',
      'message_ids': messageIds,
    }));
  }


  // getMoreMsg() async {
  //    // statusRequest(StatusRequest.loading);
  //    isLoading = true ;
  //    //loading
  //      update();
  //     if (await checkinternet()) {
  //       var res = await chatData.getMoreMsg({
  //         "conversation_id": conversationId,
  //         "limit": "10",
  //         "offset": offset.toString(),
  //       });
  //       if (res["status"] == "success") {
  //           List data = res["data"];
  //        messages.addAll(data.map((e) =>  MessageModel.fromJson(e),));
  //         // statusRequest(StatusRequest.success);
        
  //       } else if (res["status"] == "failure") {
  //          "no massge is emapty ";
  //       // statusRequest(StatusRequest.failure);
  //        // globalSnakbar(title: "Waring", body: "Email Exists");
  //         // Get.defaultDialog(
  //         //     title: "Waring",
  //         //     middleText: "Email Exists",
  //         //     actions: [
  //         //       ElevatedButton(
  //         //           onPressed: () {
  //         //             Get.back();
  //         //           },
  //         //           child: Text("Ok"))
  //         //     ]);

  //       } 
  //     } else {
  //    //   statusRequest(StatusRequest.offlineFailure);
  //     }
    
  //  isLoading = false ;
  //   update();
  // }


  

  @override
  void onClose() {
    channel.sink.close();
    _messageStreamController.close();
    statesStreemController.close();
    super.onClose();
  }
}
