import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  String email , password, confirmPass;

  String validationEmail(String val){
    if(val.isEmpty || !val.isEmail){
      return 'Enter Valid Email';
    }else{
      return null;
    }
  }
  String validationPassword(String val){
    if(val.isEmpty || val.length < 8){
      return 'Error password';
    } else{
      return null;
    }
  }
  String validationConfirmPassword(String val){
    if(confirmPass == password){
      return null;
    } else{
      return 'Error password Similer';
    }
  }
}