import 'package:flutter/material.dart';

//ToDo: This File To Add All Things Is Constant Inside Our Project
//----------------Colors----------------//
const K1Color1A73CA = Color(0xff1A73CA);
const K2ColorFBFBFB = Color(0xffFBFBFB);
const K3ColorE5F2FF = Color(0xffE5F2FF);
const K4Color7FAEDD = Color(0xff7FAEDD);
const K5Color0262BF = Color(0xff0262BF);
const K6Colorc4c4c4 = Color(0xffc4c4c4);
const K7Color9DBEDD = Color(0xff9DBEDD);
const K6Color = Colors.blue;
const KBlackColor = Colors.black;
const KWhiteColor = Colors.white;
const colorizeColors = [
  Colors.white,
  Colors.transparent,
  Colors.black,
];

const colorizeTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  fontFamily: 'Horizon',
);
//----------------Colors----------------//

//----------------Text----------------//
final String projectName = 'Tenders';
final String login = 'LogIn';
final String register = 'Register';
//----------------Text----------------//

//----------------Fonts----------------//
final String mainFont = '';
//----------------Fonts----------------//

//----------------Padding----------------//
const kDefaultPadding = 20.0;


Size getScreenSize(BuildContext context){
  return MediaQuery.of(context).size;
}