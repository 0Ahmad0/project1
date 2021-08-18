import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';

import '../testDialog.dart';

class EmployeesScreen extends StatelessWidget {
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
        onPressed: (){
          Get.to(TestDialog());
          // Get.dialog(
          //   Center(
          //     child: Container(
          //       margin: EdgeInsets.symmetric(horizontal: getScreenSize(context).width *0.04),
          //       width: double.infinity,
          //       height: getScreenSize(context).height * 0.7,
          //       decoration: BoxDecoration(
          //         color: K7Color9DBEDD
          //       ),
          //       child: Column(
          //         children: [
          //           Container()
          //         ],
          //       ),
          //     ),
          //   )
          // );
        },
      ),
      appBar: AppBar(
        title: Text('Employees'),
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
          itemBuilder: (ctx,index)=>BuildCardEmployees(
            names: names,
            index: index,
            deleteShow: index%2==0?true:false,
          ),
        ),
      ),
    );
  }
}

class BuildCardEmployees extends StatelessWidget {
  final List<String> names;
  final int index;
  final bool deleteShow;

  const BuildCardEmployees({Key key, this.names, this.index, this.deleteShow = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).width *0.35,
      padding: EdgeInsets.all(getScreenSize(context).width *0.03),
      margin: EdgeInsets.all(getScreenSize(context).width *0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: K3ColorE5F2FF
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(names[index],style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: getScreenSize(context).width *0.05
              ),),
              IconButton(icon: Icon(Icons.delete_forever,size: getScreenSize(context).width *0.08,), onPressed: (){}),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email : Rama@company.com',style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: getScreenSize(context).width *0.05
              ),),
              IconButton(icon: Icon(Icons.edit,size: getScreenSize(context).width *0.08,), onPressed: (){}),

            ],
          ),

        ],
      ),
    );
  }
}

