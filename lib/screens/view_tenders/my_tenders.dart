import 'dart:math';

import 'package:flutter/material.dart';
import 'package:p_1/constants/const.dart';

class MyTenders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: K1Color1A73CA,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext) => Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.cyan,
              ),
            ),
          );
        },
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
          'My Tenders',
          style: TextStyle(fontSize: size.width * 0.07),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.jpg'))),
          child: ListView.builder(
              padding: EdgeInsets.only(top: size.width * 0.05),
              itemCount: 20,
              itemBuilder: (context, index) =>
                  BuildContainerMyTenders(size: size))),
    );
  }
}

class BuildContainerMyTenders extends StatelessWidget {
  const BuildContainerMyTenders({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.07, right: size.width * 0.02),
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.width * 0.015),
      width: size.width,
      height: size.width * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: K3ColorE5F2FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('120-ite_university_chairs_lamp'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '08:00 Am 1/1/2020',
                    style: TextStyle(fontSize: size.width * 0.032, height: 1.5),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    '1 day Left',
                    style: TextStyle(
                        fontSize: size.width * 0.032,
                        height: 1.5,
                        color: Colors.grey[600]),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_forever),
          )
        ],
      ),
    );
  }
}
