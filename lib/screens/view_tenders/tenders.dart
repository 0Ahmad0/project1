import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p_1/constants/const.dart';

import '../company_screen.dart';

class Tenders extends StatefulWidget {
  String nameTenders;
  String image;
  String companyName;
  String startDateTender;
  String endDateTender;
  Tenders(
      {this.nameTenders,
      this.image,
      this.companyName,
      this.endDateTender,
      this.startDateTender});
  @override
  _TendersState createState() => _TendersState();
}

class _TendersState extends State<Tenders> {
  List<String> documents = [
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Submit'),
        icon: Icon(FontAwesomeIcons.telegramPlane,size: size.width * 0.06,),
        backgroundColor: K1Color1A73CA,
      ),
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
          'Tender',
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
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/background.jpg'))
        ),
        child: ListView(
         children: [
           Stack(
             children: [
               Container(
                 padding: EdgeInsets.symmetric(
                     horizontal: size.width * 0.1,
                     vertical: size.width * 0.03),
                 width: size.width,
                 height: size.width * 0.5,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(50),
                       bottomLeft: Radius.circular(50),
                     ),
                     gradient: LinearGradient(
                         begin: AlignmentDirectional.bottomEnd,
                         end: AlignmentDirectional.centerEnd,
                         colors: [
                           Colors.white,
                           K4Color7FAEDD,
                         ])),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Event Name:',
                           style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                         Text(
                           widget.nameTenders,
                           style: TextStyle(),
                         ),
                         SizedBox(
                           height: size.width * 0.08,
                         ),
                         Text.rich(TextSpan(children: [
                           TextSpan(
                               text: 'Start Date: ',
                               style: TextStyle(fontWeight: FontWeight.bold)),
                           TextSpan(
                               text: widget.startDateTender,
                               style: TextStyle()),
                         ])),
                         SizedBox(
                           height: size.width * 0.02,
                         ),
                         Text.rich(TextSpan(children: [
                           TextSpan(
                               text: 'End Date: ',
                               style: TextStyle(fontWeight: FontWeight.bold)),
                           TextSpan(
                               text: widget.endDateTender, style: TextStyle()),
                         ])),
                         SizedBox(
                           height: size.width * 0.04,
                         ),
                         Text.rich(TextSpan(children: [
                           TextSpan(
                               text: 'Company Name: ',
                               style: TextStyle(fontWeight: FontWeight.bold)),
                           TextSpan(
                               text: widget.companyName, style: TextStyle()),
                         ])),
                       ],
                     ),
                   ],
                 ),
               ),
               InkWell(
                 onTap: (){
                   Get.to(CompanyScreen());
                 },
                 child: Container(
                     margin: EdgeInsets.only(
                         top: size.width * 0.4, left: size.width * 0.4),
                     child: CircleAvatar(
                       radius: size.width * 0.095,
                       backgroundImage: AssetImage(widget.image),
                     )),
               ),
             ],
           ),
           Container(
             margin: EdgeInsets.only(
                 top: size.width * 0.025,bottom: size.width * 0.025),
             width: size.width,
             height: size.width * 0.1,
             decoration: BoxDecoration(color: K1Color1A73CA),
             child: Center(
               child: Text(
                 'Documents',
                 style: TextStyle(
                     fontSize: size.width * 0.07, color: Colors.white),
               ),
             ),
           ),
           Container(
             height: size.width * 0.92,
             padding: EdgeInsets.only(bottom: size.width * 0.235),
             child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: documents.length,
                 itemBuilder: (context, index) =>
                     BuildDowmloadDocuments(size: size)
             ),
           ),
         ],
          ),
      ),
    );
  }
}

class BuildDowmloadDocuments extends StatelessWidget {
  const BuildDowmloadDocuments({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: size.width * 0.05),
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.width * 0.01),
      width: size.width,
      height: size.width * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: K3ColorE5F2FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('File Name'),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.download_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
