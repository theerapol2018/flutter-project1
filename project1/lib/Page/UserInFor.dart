import 'package:flutter/material.dart';
import 'package:project1/data/User.dart';


class UserInFor extends StatelessWidget{
  final User user ;
  const UserInFor({Key key, this.user}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Padding( 
        padding: EdgeInsets.all(50.0),
        child: Column( 
          children: <Widget>[ 
            Text("Firstname: "+user.firstname),
            Text("Lastname: "+user.lastname),
            Text("StudentID: "+user.idstudent),
           
          ],
        ),
      ),
    );
  }
}