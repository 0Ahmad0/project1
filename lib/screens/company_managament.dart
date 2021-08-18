import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_1/constants/const.dart';
import 'package:p_1/widgets/text_input_filed.dart';

import 'view_tenders/tender_details.dart';

class CompanyManagamentScreen extends StatefulWidget {
  @override
  _CompanyManagamentScreenState createState() => _CompanyManagamentScreenState();
}

class _CompanyManagamentScreenState extends State<CompanyManagamentScreen> {
  PageController _pageController;
  int currentIndex = 0;


  String nameTest = '';

  List<String> nameMembers = ['Ahmad','Rama','Rama','Ahmad'];




  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: K1Color1A73CA,
        leading: IconButton(
          //TODO: OnClick Do Something
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          'TendersDetails',
          style: TextStyle(fontSize: size.width * 0.07),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(
            width: size.width * 0.02,
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'))),
        child: Column(
          children: [
            Row(
              children: [
                BuildButtonDetailsPage(
                  size: size,
                  text: 'Committees',
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                      _pageController.jumpToPage(currentIndex);
                    });
                  },
                  isActive: currentIndex == 0? true : false,
                ),
                BuildButtonDetailsPage(
                  size: size,
                  text: 'Accounts',
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                      _pageController.jumpToPage(currentIndex);
                    });
                  },
                  isActive: currentIndex == 1 ? true : false,
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: PageView(
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                    // print(currentIndex);
                  });
                },
                controller: _pageController,
                children: [
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: K1Color1A73CA,
                      child: Icon(Icons.add,size: size.width * 0.065,),
                      onPressed: (){
                        showDialog(context: context,builder: (BuildContext context)=>
                            Center(
                              child: Container(width: size.width *0.85, height: size.height * 0.6,
                                padding: EdgeInsets.symmetric(vertical: size.width * 0.05, horizontal: size.width * 0.03),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextInputFiled(
                                        prefixIcon: Icons.person,
                                        hintText: 'Name',
                                        inputType:TextInputType.name,
                                        inputAction: TextInputAction.next,
                                        onChanged: (text){
                                          setState(() {
                                            nameTest = text;
                                          });
                                        },
                                        obscureText: false,
                                      ),
                                      Text('Members : '),
                                      Container(
                                        padding: EdgeInsets.all(size.width * 0.01),
                                        width: size.width * 0.8,
                                        height:  size.width * 0.5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Color(0xffC4C4C4)
                                        ),
                                        child: ListView.builder(
                                          itemCount: nameMembers.length,
                                          itemBuilder: (context, index)=>Container(
                                            width: size.width ,
                                            height: size.width *0.13,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF909090),
                                                borderRadius: BorderRadius.circular(100.0)
                                            ),
                                            margin: EdgeInsets.all(size.width *0.01),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width *0.03,
                                                vertical: size.width *0.03
                                            ),
                                            child: Text(
                                              nameMembers[index],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: size.width *0.06
                                              ),),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: FlatButton(
                                            color: Color(0xFF909090),
                                            onPressed: (){
                                              setState(() {
                                                // print(nameTest);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text('submit')),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        );
                      },
                    ),
                    body: Container(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index) =>
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width *0.03,
                                    vertical: size.width *0.015
                                ),
                                width: size.width * 0.8,
                                height:  size.width * 0.18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: K3ColorE5F2FF
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('File${index + 1}',style: TextStyle(
                                      fontSize: size.width * 0.05,
                                    ),),
                                    IconButton(icon: Icon(Icons.download_sharp),
                                        onPressed: (){
                                          setState(() {
                                            showDialog(context: context,
                                                builder: (BuildContext){
                                                  return Stack(
                                                    alignment: AlignmentDirectional.center,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        color: Colors.greenAccent,
                                                        child: Center(
                                                          child: Text('successful'),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          });
                                        })
                                  ],
                                ),
                              ),
                        )
                    ),
                  ),

                  Scaffold(
                    backgroundColor: Colors.transparent,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: K1Color1A73CA,
                      child: Icon(Icons.add,size: size.width * 0.065,),
                      onPressed: (){
                        showDialog(context: context,builder: (BuildContext context)=>
                            CreateDialogAccounts()
                        );
                      },
                    ),
                    body: Container(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index) =>
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width *0.03,
                                    vertical: size.width *0.015
                                ),
                                width: size.width * 0.8,
                                height:  size.width * 0.18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: K3ColorE5F2FF
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: size.width * 0.07,
                                          backgroundImage: AssetImage(
                                              'assets/images/02.jpg'
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.045,),
                                        Text('User${index + 1}',style: TextStyle(
                                          fontSize: size.width * 0.05,
                                        ),),
                                      ],
                                    ),
                                    Text('08:00 Am 1/1/2020',style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Colors.grey[600]
                                    ),),
                                  ],
                                ),
                              ),
                        )
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateDialogAccounts extends StatefulWidget {
  @override
  _CreateDialogAccountsState createState() => _CreateDialogAccountsState();
}

class _CreateDialogAccountsState extends State<CreateDialogAccounts> {
  bool _observerText = true;
  IconData suffixIcon = FontAwesomeIcons.eyeSlash;
  IconData prefixIcon = Icons.lock;
  bool isMember = false;
  bool isOfficial = false;
  bool isActive1 = true;
  bool isActive2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Center(
      child: Container(width: size.width *0.85, height: size.height * 0.6,
        padding: EdgeInsets.symmetric(vertical: size.width * 0.05, horizontal: size.width * 0.03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputFiled(
                prefixIcon: Icons.person,
                hintText: 'Name',
                inputType:TextInputType.name,
                inputAction: TextInputAction.next,
                onChanged: (text){
                  setState(() {
                    // nameTest = text;
                  });
                },
                obscureText: false,
              ),
              TextInputFiled(
                prefixIcon: Icons.email,
                hintText: 'Email',
                inputType:TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                onChanged: (text){
                  setState(() {
                    // nameTest = text;
                  });
                },
                obscureText: false,
              ),
              TextInputFiled(
                obscureText: _observerText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: 'Password',
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                onPressed: (){
                  setState(() {
                    _observerText = !_observerText;
                    _observerText? (suffixIcon = FontAwesomeIcons.eyeSlash):(suffixIcon = FontAwesomeIcons.eye);
                    _observerText? (prefixIcon = Icons.lock):(prefixIcon = Icons.lock_open);
                  });
                },
              ),
              TextInputFiled(
                obscureText: _observerText,
                prefixIcon: prefixIcon,
                hintText: 'Confrim Password',
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isMember, onChanged:(value){
                    setState(() {
                      isMember = value;
                      isOfficial = !value;
                    });
                  }
                  ),
                  SizedBox(width: 15.0,),
                  Text('Member OR Client'),
                  Checkbox(value: isOfficial, onChanged:(value){
                    setState(() {
                      isOfficial = value;
                      isMember = !value;
                    });
                  }),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


