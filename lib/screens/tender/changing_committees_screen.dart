import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/helper_class/employee.dart';
import 'package:project1/screens/tender/employees_screen.dart';

class ChangingCommitteesScreen extends StatelessWidget {
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
        title: Text('changing committees'),
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
          itemBuilder: (ctx,index)=>BuildCardChanning(
            names: names,
            index: index,
            deleteShow: index%2==0?true:false,
          ),
        ),
      ),
    );
  }
}

class BuildCardChanning extends StatelessWidget {
  final List<String> names;
  final int index;
  final bool deleteShow;

  const BuildCardChanning({Key key, this.names, this.index, this.deleteShow = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).width *0.25,
      padding: EdgeInsets.all(getScreenSize(context).width *0.03),
      margin: EdgeInsets.all(getScreenSize(context).width *0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: K3ColorE5F2FF
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Take decision Committee',style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: getScreenSize(context).width *0.05
              ),),
              SizedBox(height: getScreenSize(context).width *0.02,),
              Text('${index + 2} members',style: TextStyle(
                color: Colors.black.withOpacity(.42)
              ),),

            ],
          ),
          deleteShow?IconButton(icon: Icon(Icons.delete_forever,size: getScreenSize(context).width *0.1,), onPressed: (){
            Get.to(EmployeesScreen());
          }):SizedBox(),
        ],
      ),
    );
  }
}
