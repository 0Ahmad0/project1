import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p_1/constants/const.dart';
import 'package:p_1/widgets/text_input_filed.dart';

class CreateNewTender extends StatefulWidget {
  @override
  _CreateNewTenderState createState() => _CreateNewTenderState();
}

class _CreateNewTenderState extends State<CreateNewTender> {
  bool iconActive = false;

  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(
                2019, 08, 1,
                selectedTime.hour,
                selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(
            2019, 08, 1,
            DateTime.now().hour,
            DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    dateTime = DateFormat.yMd().format(DateTime.now());
    String valdetor  = 'hi';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: K1Color1A73CA,
        actions:[
          IconButton(
            //TODO: OnClick Do Something
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ] ,
        title: Text(
          'Create New Tender',
          style: TextStyle(fontSize: size.width * 0.07),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg')
            )
        ),
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.1,),
            TextInputFiled(
                prefixIcon: Icons.assignment,
                hintText: 'Tender Name',
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                obscureText: false
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
              child: Divider(
                color: K1Color1A73CA,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding /2,
              ),
              padding: EdgeInsets.only(
                  left: size.width * 0.025
              ),
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  color: K6Colorc4c4c4,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.1 ,
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          isDense: false,
                          border: InputBorder.none,
                          icon: Icon(Icons.date_range_outlined)
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Text('Time',style: TextStyle(
                      fontSize: size.width * 0.06,
                      color: Colors.black54
                  ),),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: size.width * 0.3,
                      height: size.width * 0.15,
                      alignment: Alignment.center,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onSaved: (String val) {
                          _setDate = val;
                        },
                        decoration: InputDecoration(
                            disabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(top: 0.0)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      width: size.width * 0.3,
                      height: size.width * 0.15,
                      alignment: Alignment.center,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        onSaved: (String val) {
                          _setTime = val;
                        },
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _timeController,
                        decoration: InputDecoration(
                            disabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
              child: Divider(
                color: K1Color1A73CA,
              ),
            ),
            InkWell(
              onTap: (){
                print('Uploade Files');
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding /2,
                ),
                padding: EdgeInsets.only(
                    left: size.width * 0.025
                ),
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    color: K6Colorc4c4c4,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.1 ,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.attach_file),
                        ),
                        textInputAction: TextInputAction.next,

                      ),
                    ),
                    Text('Uploade Files ',style: TextStyle(
                        fontSize: size.width * 0.06,
                        color: Colors.black54
                    ),),
                    IconButton(
                      onPressed: (){
                        print('Uploade File');
                      },
                      icon: Icon(Icons.cloud_upload_rounded),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
              child: Divider(
                color: K1Color1A73CA,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: K6Colorc4c4c4,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2),
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'About...',
                    border: InputBorder.none
                ),
                minLines: 3,
                maxLines: 5,
                textInputAction: TextInputAction.next,
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.25,vertical: size.width * 0.15),
                height: size.width * 0.15,
                decoration: BoxDecoration(
                    color: K1Color1A73CA,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Center(
                  child: Text('Create',style: TextStyle(
                      fontSize: size.width * 0.07,
                      color: Colors.white
                  ),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
