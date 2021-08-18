import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/const.dart';
import 'package:project1/screens/view_tenders/view_tenders.dart';
import 'package:project1/screens/welcome_screen.dart';

import 'screens/tender/financial_committees_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tenders',
      theme: ThemeData(
        primaryColor: K1Color1A73CA,
      ),
      home: FinancialCommitteesScreen(),
    );
  }
}

