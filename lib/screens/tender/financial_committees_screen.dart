import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_1/constants/const.dart';
import 'package:p_1/screens/tender/changing_committees_screen.dart';

class FinancialCommitteesScreen extends StatelessWidget {
  List<String> names = [
    'Rama Re',
    'Ahmad Al',
    'Mohamad Bt',
    'Verdan',
    'Colunjscn',
    'Salam',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Financial committees'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Get.back();
            },
          ),
          SizedBox(width: getScreenSize(context).width * 0.045,)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg')
          )
        ),
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (ctx,index)=>BuildCardFinancial(
            names: names,
            index: index,
          ),
        ),
      ),
    );
  }
}

 class BuildCardFinancial extends StatelessWidget {
  final List<String> names;
  final int index;

  const BuildCardFinancial({Key key, this.names, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).width *0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: K3ColorE5F2FF
      ),
      padding: EdgeInsets.all(getScreenSize(context).width *0.03),
      margin: EdgeInsets.all(getScreenSize(context).width *0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( names[index],style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: getScreenSize(context).width *0.05
              ),),
              Text('Email : Rama@company.com',style: TextStyle(
                  fontWeight: FontWeight.w700
              ),),
              Text('employee',style: TextStyle(
                color: Colors.black.withOpacity(.42)
              ),),
            ],
          ),
          IconButton(icon: Icon(Icons.delete_forever,size: getScreenSize(context).width *0.1,), onPressed: (){
            Get.to(ChangingCommitteesScreen());
          }),
        ],
      ),
    );
  }
}
