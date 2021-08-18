
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/controller/forget_password_controller.dart';
import 'package:project1/widgets/create_button.dart';
import 'package:project1/widgets/text_input_filed.dart';

import 'login_screen.dart';
import 're_password_screen.dart';
class ForgetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode : AutovalidateMode.onUserInteraction,
          child: GetBuilder<ForgetPasswordController>(
            init: ForgetPasswordController(),
            builder: (ctx)=>Column(
              children: [
                Container(
                  width: size.width,
                  height: size.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.bottomEnd,
                          colors: [
                            Color(0xff9CBDDD),
                            K1Color1A73CA,
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Center(
                    child: Text(
                      login,
                      style: TextStyle(
                          fontSize: size.width * 0.12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.width * 0.35,),
                Text('Enter your company email to change the password.'),
                SizedBox(height: 15.0,),
                TextInputFiled(
                  validator: (val){
                    return ctx.validationEmail(val);
                  },
                  obscureText: false,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                ),
                SizedBox(height: 15.0,),
                CreateButton(
                  text: 'Next',
                  onTap: (){
                    if(_formKey.currentState.validate()){
                      Get.to(RePassword());
                    }
                  },
                ),
                SizedBox(height: 15.0,),
                Container(
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.black))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}