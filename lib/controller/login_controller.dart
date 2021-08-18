import 'package:get/get.dart';

class LoginController extends GetxController{
  String userName , password;

  String validationUserName(String val){
    if(val.isEmpty){
      return 'Enter Valid UserName';
    }else{
      return null;
    }
  }

  String validationPassword(String val){
    if(val.isEmpty){
      return 'Enter Valid Password';
    }else{
      return null;
    }
  }
}