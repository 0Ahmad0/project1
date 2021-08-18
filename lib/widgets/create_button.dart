import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    Key key,
    this.text,
    this.onTap,
    this.colorButton = Colors.blue
  }) : super(key: key);

  final String text;
  final Function onTap;
  final Color colorButton;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        //TODO: Selected Button Color
          color: colorButton,
          borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
