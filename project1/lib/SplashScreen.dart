
import 'dart:async';
import 'dart:convert';
import 'package:project1/HomeClass.dart';
import 'package:project1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'data/API.dart';
import 'data/User.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {
  int i;
  var users = new List<User>();
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(xIndex == null){
      Navigator.of(context).pushNamed("/" + login);
    }else{
      print(" I = " + i.toString());
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeClass( user: users[i],)),);
    }
  }

  getIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     final int intValue = prefs.getInt('Index')?? 0;
     xIndex = intValue;
     i = intValue;
     print("getIndex : == "+ intValue.toString());

    API.getUsersformDB().then((response) {
      // setState(() {
      Iterable list = json.decode(response.body);
      users = list.map((model) => User.fromJson(model)).toList();
      print(users[i].firstname);
      // });
    });
  }
  
  @override
  void initState() {
    super.initState();
    getIndex();
    startTime();
  }
  
  
  Widget build(BuildContext context) {
 
    return  Scaffold(
     body: new Center(
        child:Column( 
          children: <Widget>[ 
            Padding( 
              padding: EdgeInsets.all(50.0),
              child: Column( 
                children: <Widget>[ 
                  Text("Welcome To SUT Attendance",
                    style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }


  
}