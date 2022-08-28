import 'package:chefio1/constans/colors.dart';
import 'package:chefio1/view/screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          //this Font we will use later 'H1'

          headline1: TextStyle(
            color: mainText,
            fontFamily: 'Inter',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),

          //this font we will use later 'H2'

          headline2: TextStyle(
            color: mainText,
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          //this font we will use  later 'H3'

          headline3: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),

          //this font we will use later 'P1'

          bodyText1: TextStyle(
            color: SecondaryText,
            fontFamily: 'Inter',
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),

          //this font we will use later 'P2'

          bodyText2: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          //this font we will use later 'S'
          subtitle1: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          //thus we have added all the fonts used in the projct ..
        ),
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
