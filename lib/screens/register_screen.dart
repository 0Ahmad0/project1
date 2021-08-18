import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/controller/register_controller.dart';
import 'package:project1/controller/text_input_controller.dart';
import 'package:project1/screens/confirm_code/confirm_code.dart';
import 'package:project1/screens/forget_password_screen.dart';
import 'package:project1/widgets/create_button.dart';
import 'package:project1/widgets/text_input_filed.dart';

class RegisterScreen extends StatelessWidget {
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
                ))),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode : AutovalidateMode.onUserInteraction,
            child: GetBuilder<RegisterController>(
              init: RegisterController(),
              builder: (ctx) => Column(
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
                        register,
                        style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.72,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.userName = val;
                          },
                          validator: (value) {
                            return ctx.validationUserName(value);
                          },
                          obscureText: false,
                          suffixIcon: null,
                          prefixIcon: FontAwesomeIcons.userCircle,
                          hintText: 'User Name',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.companyEmail = val;
                          },
                          validator: (value) {
                            return ctx.validationEmail(value);
                          },
                          obscureText: false,
                          suffixIcon: null,
                          prefixIcon: FontAwesomeIcons.envelope,
                          hintText: 'Company Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.companyName = val;
                          },
                          validator: (val) {
                            return ctx.validationCompanyName(val);
                          },
                          obscureText: false,
                          suffixIcon: null,
                          prefixIcon: Icons.work_outline,
                          hintText: 'Company Name',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.directorName = val;
                          },
                          validator: (val) {
                            return ctx.validationDirectorName(val);
                          },
                          obscureText: false,
                          suffixIcon: null,
                          prefixIcon: Icons.person_outline,
                          hintText: 'Director Name',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              decoration: BoxDecoration(
                                  color: K6Colorc4c4c4,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: GetBuilder<RegisterController>(
                                init: RegisterController(),
                                builder: (_) => DropdownButtonFormField(
                                  value: ctx.selectedLocation,
                                  items: _.location.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                      hintText: 'Location',
                                      border: InputBorder.none),
                                  onChanged: (val) {
                                    ctx.selectedLocation = val;
                                  },
                                  validator: (val) {
                                    return ctx.validationLocation(val);
                                  },
                                ),
                              )),
                        ),
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.mobile = val;
                          },
                          validator: (val) {
                            return ctx.validationMobile(val);
                          },
                          obscureText: false,
                          prefixIcon: FontAwesomeIcons.mobileAlt,
                          hintText: 'Mobile',
                          inputType: TextInputType.phone,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputFiled(
                          onChanged: (val) {
                            ctx.bank = val;
                          },
                          validator: (val) {
                            return ctx.validationBank(val);
                          },
                          obscureText: false,
                          prefixIcon: Icons.apartment,
                          hintText: 'Banck',
                          inputType: TextInputType.phone,
                          inputAction: TextInputAction.next,
                        ),
                        GetBuilder<TextInputFiledController>(
                          init: TextInputFiledController(),
                          builder: (_) => TextInputFiled(
                            obscureText: _.observerText,
                            onChanged: (val) {
                              ctx.password = val;
                            },
                            validator: (val) {
                              return ctx.validationPassword(val);
                            },
                            hintText: 'Password',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            suffixIcon: _.suffixIcon,
                            prefixIcon: _.prefixIcon,
                            onPressed: _.changeIcon,
                          ),
                        ),
                        GetBuilder<TextInputFiledController>(
                            builder: (_) => TextInputFiled(
                                  onChanged: (val) {
                                    ctx.confrimPass = val;
                                  },
                                  validator: (val) {
                                    return ctx.validationConfirmPassword(val);
                                  },
                                  obscureText: _.observerText,
                                  prefixIcon: _.prefixIcon,
                                  hintText: 'Confrim Password',
                                  inputType: TextInputType.text,
                                  inputAction: TextInputAction.done,
                                )),
                        Container(
                          decoration: BoxDecoration(
                              color: K6Colorc4c4c4,
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding / 2),
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding / 2),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'About Company',
                                border: InputBorder.none),
                            minLines: 4,
                            maxLines: 5,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: CreateButton(
                      text: 'Sign Up',
                      colorButton: K1Color1A73CA,
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          //TODO Connect Api Json File
                          Get.to(ConfirmCodeRegister(),
                              transition: Transition.zoom);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
