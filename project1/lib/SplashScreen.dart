
import 'dart:convert';
import 'package:project1/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'data/API.dart';
import 'data/User.dart';



class MySplashSreen extends StatelessWidget   {
  @override
  
  Widget build(BuildContext context) {
    var users = new List<User>();
    API.getUsersformDB().then((response) {

      Iterable list = json.decode(response.body);
      users = list.map((model) => User.fromJson(model)).toList();
      print(users[0].firstname);

    });
    // int numForHome = toto();

    return  SplashScreen(
      
      seconds: 5,
      //navigateAfterSeconds: new AfterSplash(),
      // navigateAfterSeconds:  getIndex() == null ? Login(): HomeClass( i: 0),
      navigateAfterSeconds:  getIndex() == null ? Login():Login(),
      title:  Text('Welcome In SplashScreen',
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      loaderColor: Colors.red,
    );
  }

  getIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     
     final int intValue = prefs.getInt('Index')?? 0;
     print(intValue);
    return intValue;
    
  }
  // toto() async {
  //   int i = await getIndex();
  //   print(i);
  //   return i;
  // }



  
}