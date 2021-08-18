
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p_1/constants/const.dart';
import 'package:p_1/controller/forget_password_controller.dart';
import 'package:p_1/controller/text_input_controller.dart';
import 'package:p_1/screens/login_screen.dart';
import 'package:p_1/widgets/create_button.dart';
import 'package:p_1/widgets/text_input_filed.dart';

class RePassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.png')
              )
          ),
          child: GetBuilder<ForgetPasswordController>(
            init: ForgetPasswordController(),
            builder: (ctx)=>Form(
             key: _formKey,
              autovalidateMode : AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Container(
                    width: size.width,
                    height: size.width * 0.35,
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
                        'Reset Password',
                        style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.32,),
                  GetBuilder<TextInputFiledController>(
                      init: TextInputFiledController(),
                      builder: (_)=>TextInputFiled(
                        onChanged: (val){
                          ctx.password = val;
                        },
                        validator: (val){
                          return ctx.validationPassword(val);
                        },
                        obscureText: _.observerText,
                        suffixIcon: _.suffixIcon,
                        prefixIcon: _.prefixIcon,
                        hintText: 'New Password',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        onPressed: _.changeIcon,
                      )
                  ),
                  GetBuilder<TextInputFiledController>(
                    init: TextInputFiledController(),
                    builder: (_)=>TextInputFiled(
                      onChanged: (val){
                        ctx.confirmPass = val;
                      },
                      validator: (val){
                        return ctx.validationConfirmPassword(val);
                      },
                      obscureText: _.observerText,
                      prefixIcon: _.prefixIcon,
                      hintText: 'Confirm Password',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 8.0),
                    child: CreateButton(
                      text: 'Done',
                      onTap: (){
                        if(_formKey.currentState.validate()){
                          Get.to(LogInScreen(),transition: Transition.size);
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 15,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(color: Colors.black))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
