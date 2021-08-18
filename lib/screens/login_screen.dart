import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/controller/login_controller.dart';
import 'package:project1/controller/text_input_controller.dart';
import 'package:project1/screens/forget_password_screen.dart';
import 'package:project1/screens/profile_screen.dart';
import 'package:project1/screens/register_screen.dart';
import 'package:project1/widgets/create_button.dart';
import 'package:project1/widgets/text_input_filed.dart';

class LogInScreen extends StatelessWidget {
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
                image: AssetImage(
                  'assets/images/login_background.png',
                )
            )
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode : AutovalidateMode.onUserInteraction,
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (ctx) =>Column(
                children: [
                  Container(
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
                      //TODO: Create Const TextStyle
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
                  SizedBox(
                    height: size.width * 0.3,
                  ),
                  //Email Address
                  TextInputFiled(
                    validator: (val){
                      return ctx.validationUserName(val);
                    },
                    obscureText: false,
                    suffixIcon: null,
                    prefixIcon: FontAwesomeIcons.envelope,
                    hintText: 'Email or Username',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  //Password
                  GetBuilder<TextInputFiledController>(
                    init: TextInputFiledController(),
                    builder: (_) => TextInputFiled(
                      validator: (val){
                        return ctx.validationPassword(val);
                      },
                      obscureText: _.observerText,
                      hintText: 'Password',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      suffixIcon: _.suffixIcon,
                      prefixIcon: _.prefixIcon,
                      onPressed: _.changeIcon,
                    ),
                  ),
                  //Forget Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(ForgetPasswordScreen(),
                                transition: Transition.zoom);
                          },
                          child: Text(
                            'forget password?',
                            style: TextStyle(color: K1Color1A73CA, height: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Login Button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CreateButton(
                      text: login,
                      colorButton: K1Color1A73CA,
                      onTap: () {
                        //TODO: Go To MainPage APP
                        if(_formKey.currentState.validate()){
                          Get.to(ProfileScreen(),transition: Transition.rightToLeft);
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(color: Colors.black))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('don\'t have account?'),
                            TextButton(
                              onPressed: () {

                                Get.to(RegisterScreen(), transition: Transition.zoom);
                              },
                              child: Text(
                                register,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: K1Color1A73CA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
