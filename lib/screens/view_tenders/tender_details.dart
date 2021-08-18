import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/constants/const.dart';

class TenderDetails extends StatefulWidget {
  @override
  _TenderDetailsState createState() => _TenderDetailsState();
}

class _TenderDetailsState extends State<TenderDetails> {
  PageController _pageController;
  int currentIndex = 0;

  bool isActive1 = true;
  bool isActive2 = false;

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
            Container(
              width: size.width,
              height: size.width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100.0),
                    bottomLeft: Radius.circular(100.0),
                  ),
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topEnd,
                      colors: [
                        Colors.white,
                        K4Color7FAEDD,
                      ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '120-ite_university_chairs_lamp',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.07, height: 1.5),
                  ),
                  Text(
                    '08:00 Am 1/1/2020',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.04, height: 1.5),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                BuildButtonDetailsPage(
                  size: size,
                  text: 'Documents',
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
                  text: 'Companies',
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
                  Container(
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
                  Container(
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

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildButtonDetailsPage extends StatelessWidget {
  final Size size;
  final String text;
  final Function onTap;
  final bool isActive;

  const BuildButtonDetailsPage(
      {Key key, this.size, this.text, this.onTap,this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.width * 0.035),
        height: size.width * 0.12,
        decoration: BoxDecoration(
            color: K3ColorE5F2FF, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size.width * 0.05,
              height: 1.5,
              color: isActive?Colors.blue:Colors.black
            ),
          ),
        ),
      ),
    ));
  }
}
