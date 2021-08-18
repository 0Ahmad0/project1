import 'package:get/get.dart';

class RegisterController extends GetxController{
  List<String> location = ['syria','jordan','lebanon','Egypt'];
  String selectedLocation = 'syria';


  String userName,bank,companyEmail,companyName,directorName,password,confrimPass,about,mobile;
  String validationUserName(String val){
    if(val.isEmpty){
      return 'Enter Valid UserName';
    }else{
      return null;
    }
  }
  String validationEmail(String val){
    if(!val.isEmail){
      return 'Enter Valid Email';
    }else{
      return null;
    }
  }
  String validationCompanyName(String val){
    if(val.isEmpty || val.length < 3){
      return 'Enter Valid Name';
    }else{
      return null;
    }
  }
  String validationDirectorName(String val){
    if(val.isEmpty || val.length < 3){
      return 'Enter Valid Name';
    }else{
      return null;
    }

  }
  String validationLocation(String val){
    if(val.isEmpty){
      return 'Enter Valid Location';
    }else{
      return null;
    }
  }
  String validationMobile(String val){
    if(!val.isPhoneNumber){
      return 'Enter Valid phone';
    }else{
      return null;
    }
  }
  String validationBank(String val){
    if(val.isEmpty || !val.isNum){
      return 'Enter Valid Bank';
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
    if(confrimPass == password){
      return null;
    } else{
      return 'Error password Similer';
    }
  }

}