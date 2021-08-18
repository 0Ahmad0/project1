import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/controller/text_input_controller.dart';

class TextInputFiled extends StatelessWidget {
  const TextInputFiled({
    Key key,
    this.prefixIcon ,
    this.hintText = '',
    this.inputType,
    this.inputAction = TextInputAction.next,
    this.obscureText = false,
    this.suffixIcon,
    this.onPressed,
    this.validator,
    this.containerTextFiledColor = K6Colorc4c4c4,
    this.horizontalMargin = kDefaultPadding,
    this.verticalMargin = kDefaultPadding / 2, this.onChanged,
  }) : super(key: key);
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  final Function onPressed;
  final Function validator;
  final Function onChanged;
  final Color containerTextFiledColor;
  final double horizontalMargin , verticalMargin;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
        return Container(
          padding: EdgeInsets.only(top: size.width * 0.01),
          margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin,
              vertical: verticalMargin
          ),
          height: size.height * 0.08,
          decoration: BoxDecoration(
           color: containerTextFiledColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: TextFormField(
            onChanged: onChanged,
            autofocus: true,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  prefixIcon,
                  size: size.width * 0.07,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    suffixIcon
                  ),
                  onPressed: onPressed
                ),
                hintText: hintText),
            style: TextStyle(fontSize: size.width * 0.06),
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        );
  }
}
