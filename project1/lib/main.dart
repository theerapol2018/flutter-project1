import 'package:flutter/material.dart';
import 'package:project1/SignUp.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());
String signup = "signup";
int numColor = 500;
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
      // Set named routes
      SignUp.routeName: (BuildContext context) => SignUp(),
      },
    );
  }
}
