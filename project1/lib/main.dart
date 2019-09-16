import 'package:flutter/material.dart';
import 'package:project1/ForgotPW.dart';
// import 'dart:async';
import 'package:project1/SignUp.dart';
import 'package:project1/newq.dart';


import 'Login.dart';
import 'SplashScreen.dart';


String signup = "signup";
String forgetpw = "forgetpw";
String homeclass = "homeclass";
String login = "login";
String nnn = "nnn";
int numColor = 500, numColor1 = 50, numColor2 = 100;
int xIndex ;

void main()  {
 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: MySplashSreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
      // Set named routes
      SignUp.routeName: (BuildContext context) => SignUp(),
      ForgetPW.routeName: (BuildContext context) => ForgetPW(),
      // HomeClass.routeName:(BuildContext context) => HomeClass(),
      Login.routeName:(BuildContext context) => Login(),
      Newq.routeName:(BuildContext context) => Newq(),
      },
    );
  }
}
