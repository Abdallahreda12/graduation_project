import 'dart:io';

import 'package:graduation_project/core/util/class/api.dart';

const String linkServerName = "http://10.0.2.2/help_animals";
const String linkAddConverstions ="$linkServerName/chat/add_conv.php";
const String linkGetConverstions ="$linkServerName/chat/get_convs.php";
const String linkGetMassage ="$linkServerName/chat/get_msg.php";
const String linkMarkRead ="$linkServerName/chat/mark_read.php";
const String linkSendMsg ="$linkServerName/chat/send_msg.php";

class ChatData {
  ChatData();

    addConv(Map data)async{
    var res =await Api().post(uri: linkAddConverstions, body: data);
    return res;
  }

   getMoreMsg(Map data)async{
    var res =await Api().post(uri: linkGetMassage, body: data
    );
    return res;
  }
   markAsRead(Map data )async{
     var res =await Api().post(uri: linkMarkRead, body: data);
    return res;
    
  }
   sendMsg(Map data)async{
    var res =await Api().post(uri: linkSendMsg, body: data);
    return res;
  }
  
}
