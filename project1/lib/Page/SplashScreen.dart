
import 'dart:async';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HomeClass.dart';
import 'package:project1/data/API.dart';
import 'package:project1/data/User.dart';
import 'package:project1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {
  int i;
  var users = new List<User>();
  startTime() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(xIndex == null){
      Navigator.of(context).pushNamed("/" + login);
    }else{
      print(" I = " + i.toString());
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomeClass( user: users[xIndex],)),);
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
     ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return  Scaffold(
     body: new Center(
        child:Column( 
          children: <Widget>[ 
            Padding( 
              padding: EdgeInsets.only(top: 150.0),
              child: Column( 
                children: <Widget>[ 
                  Text("Welcome To SUT Attendance",
                    style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(50),),
                  SpinKitDualRing(
                    color: Colors.amber,
                    size: 50.0,
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