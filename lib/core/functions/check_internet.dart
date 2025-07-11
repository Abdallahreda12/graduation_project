 import 'dart:io';

 Future<bool>checkinternet() async
{
  try{
    
    var resulult =await InternetAddress.lookup("google.com");
    if(resulult.isNotEmpty && resulult[0].rawAddress.isNotEmpty)
    {
      return true;
    }
    else 
    {
        return false;
    }
    
  }on SocketException catch (_)
  {
    return false;
  }
}