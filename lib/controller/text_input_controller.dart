import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TextInputFiledController extends GetxController{
  bool observerText = true;
  IconData suffixIcon = FontAwesomeIcons.eyeSlash;
  IconData prefixIcon = Icons.lock_outlined;

  void changeIcon(){
    observerText = !observerText;
    observerText
        ? (suffixIcon = FontAwesomeIcons.eyeSlash)
        : (suffixIcon = FontAwesomeIcons.eye);
    observerText
        ? (prefixIcon = Icons.lock_outlined)
        : (prefixIcon = Icons.lock_open_outlined);
    update();
  }
}