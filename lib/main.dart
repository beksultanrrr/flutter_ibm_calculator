import 'package:flutter/material.dart';
import 'package:flutter122/result_page.dart';
import 'InputPage.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: Color(0XFF0A0E21),
          appBarTheme: AppBarTheme(
            color: Color(0XFF0A0E21),
          )),
      home: InputPage(),
      // routes: {
      //   '/': (context) => InputPage(),
      //   // '/second': (context) => ResultPage(

      //   // ),
      // },
    );
  }
}
