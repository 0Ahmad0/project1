import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:p_1/screens/view_tenders/view_tenders.dart';

import 'input_code_row_widget.dart';
import 'package:get/get.dart';

typedef OnValueChanged = void Function(String value);
typedef OnComplete = void Function(String value);

class ConfirmCodeRegister extends StatefulWidget {
  final OnValueChanged onValueChanged;
  final OnComplete onComplete;

  const ConfirmCodeRegister({Key key, this.onValueChanged, this.onComplete}) : super(key: key);
  @override
  _ConfirmCodeRegisterState createState() => _ConfirmCodeRegisterState();
}

class _ConfirmCodeRegisterState extends State<ConfirmCodeRegister> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String _inputCode = "";
  int _temp = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = "";
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      // auto focus
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('A verification code has been sent to ah****@***.com please enter the code to continue.',textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.width * 0.2,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                   InputRowWidget(
                      inputCode: _inputCode,
                    ),
                    Opacity(
                      opacity: 0.0,
                      child: TextField(
                        style: TextStyle(color: Colors.transparent, fontSize: 0),
                        // only digits
                        inputFormatters: [WhitelistingTextInputFormatter(RegExp(r"[0-9]"))],
                        keyboardType: TextInputType.number,
                        focusNode: _focusNode,
                        controller: _controller,
                        maxLength: 6,
                        onChanged: (String value) {
                          if(_inputCode.length == 5){
                            //ToDo Go To Home Page
                            Get.to(ViewTenders());
                          }
                          _inputCode = _controller.text;

                          if (widget.onValueChanged != null) {
                            widget.onValueChanged(_inputCode);
                          }

                          if (_inputCode.length < 6) {
                            _temp = 0;
                          } else if (_inputCode.length == 6) {
                            // dismiss the keyboard
                            _focusNode.unfocus();
                            _temp++;
                            if (_temp == 1) {
                           //********************************************//
                              print('verificationCode---' + _inputCode);
                           //*******************************************//
                              if (widget.onComplete != null) {
                                widget.onComplete(_inputCode);
                              }
                            }
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text('resend verification code?'))
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
