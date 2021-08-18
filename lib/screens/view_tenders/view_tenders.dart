import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/widgets/build_drawer.dart';
import 'package:project1/widgets/text_input_filed.dart';

import 'tenders.dart';

class ViewTenders extends StatefulWidget {
  @override
  _ViewTendersState createState() => _ViewTendersState();
}

class _ViewTendersState extends State<ViewTenders> {
  List<String> tenders = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  static const routeName = '/LightDrawerPage';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: AppBar(
        backgroundColor: K1Color1A73CA,
        title: Text(
          'View Tenders',
          style: TextStyle(fontSize: size.width * 0.07),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _key.currentState.openEndDrawer();
            },
            icon: Icon(Icons.more_vert),
          ),
          SizedBox(
            width: size.width * 0.02,
          )
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
      ),
      endDrawer: ClipPath(
        clipper: _RightDrawerClipper(),
        child: Drawer(
          child: Column(
            children: [
              Center(
                child: Text('Profile'),
              )
            ],
          ),
        ),
      ),
      drawer: BuildLeftDrawer(
        child: Column(
          children: [
            Text('Setting and Privacy',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize:25.0,
              height: 2.0
            ),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      'assets/images/logo.png',
                  ),
                ),
                SizedBox(width: 15.0,),
                Text('Rama Re',style: TextStyle(
                    fontSize:25.0,
                    height: 2.0
                ),),
              ],
            ),
            SizedBox(height: 40.0,),
           DrawerButton(
             text: 'Account',
             widget: null,
           ),
           DrawerButton(
             text: 'Setting',
             widget: null,
           ),
           DrawerButton(
             text: 'About us',
             widget: null,
           )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TODO : Change This BoxSearch From Widget TextFiled To Custom
              TextInputFiled(
                inputType: TextInputType.text,
                obscureText: false,
                inputAction: TextInputAction.search,
                hintText: 'search',
                horizontalMargin: size.width * 0.02,
                verticalMargin: size.width * 0.03,
                prefixIcon: Icons.search,
                containerTextFiledColor: K2ColorFBFBFB,
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.788,
                padding: EdgeInsets.only(
                  bottom: 10.0
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tenders.length,
                  itemBuilder: (context, index) => BuildListViewTenders(size: size),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RightDrawerClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}

class DrawerButton extends StatelessWidget {
  final Widget widget;
  final String text;

  const DrawerButton({Key key, this.widget, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30.0
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black38
          )
        )
      ),
      child: FlatButton(
        minWidth: double.infinity,
        onPressed: (){
          Get.to(widget,transition: Transition.fade);
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}

class BuildListViewTenders extends StatelessWidget {
  const BuildListViewTenders(
      {Key key,
      @required this.size,
      this.titleTenders = '120-ite_university_chairs_lamp',
      this.image = 'assets/images/01.jpg',
      this.startDateTenders = '08:00 Am 1/1/2020',
      this.companyName = 'Rama Re'})
      : super(key: key);

  final Size size;
  final String titleTenders;
  final String image;
  final String startDateTenders;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Tenders(
                      nameTenders: titleTenders,
                      image: image,
                      startDateTender: startDateTenders,
                      endDateTender: 'endDateTenders',
                      companyName: companyName,
                    )));
      },
      child: Container(
        width: size.width,
        height: size.width * 0.23,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.02, vertical: size.width * 0.005),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: K2ColorFBFBFB),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
                Text(
                  companyName,
                  style: TextStyle(fontSize: size.width * 0.03, height: 1.8),
                )
              ],
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleTenders),
                Row(
                  children: [
                    Text('1 day Left'),
                    SizedBox(
                      width: size.width * 0.2,
                    ),
                    Text(startDateTenders),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
