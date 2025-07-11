import 'dart:io';

import 'package:graduation_project/core/util/class/api.dart';

const String linkServerName = "http://10.0.2.2/help_animals";
const String linkAddConverstions ="$linkServerName/chat/add_conv.php";
const String linkGetConverstions ="$linkServerName/chat/get_convs.php";
const String linkGetMassage ="$linkServerName/chat/get_msg.php";
const String linkMarkRead ="$linkServerName/chat/mark_read.php";
const String linkSendMsg ="$linkServerName/chat/send_msg.php";



class ChatData {
  Api api = Api() ;
  Future<Map<String, dynamic>> getMessages(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> getConversations(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> createConversation(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> markMessagesRead(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> sendMessage(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> getUserStatus(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }

  Future<Map<String, dynamic>> updateUserStatus(Map<String, String> data) async {
    var response = await api.post(uri:  "AppLink.getMessages" , body :  data);
    return response.fold((l) => {"status": "failure"}, (r) => r);
  }











}
