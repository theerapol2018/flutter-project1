import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project1/data/JoinClass.dart';
import 'package:project1/data/User.dart';
import 'package:project1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ClassListView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


TextEditingController codeJoinClassControler = new TextEditingController();

class HomeClass extends StatelessWidget{  
  static const String routeName = "/homeclass";
  final ClassListView classListView =  ClassListView();
  final User user ;
  
  static final joinClassURL = url+'joinclass';
  HomeClass({Key key, @required this.user, }) : super(key: key);
 


  @override 
  Widget build(BuildContext context){ 
  print("HomeClass xIndex==> " + xIndex.toString());

    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomeClass',
                    style: TextStyle(  
                      color: Colors.amber
                    ),  
                  ),
        backgroundColor: Colors.amber[numColor2],
        iconTheme: new IconThemeData(color: Colors.grey),
        actions: <Widget>[
        IconButton(icon: Icon(Icons.input), 
                    onPressed: () {
                      showDialog(
                     
                        context: context,
                        builder: (_) => new AlertDialog(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                            title: new Text("Enter Code "),
                            content: Container(
                                height: 180.0, 
                                child: Column(  
                                  children: <Widget>[ 
                                    TextField(
                                      controller: codeJoinClassControler,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))
                                                                            , borderSide: BorderSide(color: Colors.amber,),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                                                borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                                                                borderRadius: BorderRadius.circular(20.0),
                                                  ),
                                          hintText: "Code",
                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                                      ),
                                      SizedBox(height: ScreenUtil.getInstance().setHeight(30),),
                                      RaisedButton( 
                                        onPressed: () async { 
                                          print(codeJoinClassControler.text);
                                          print(user.idstudent);
                                          JoinClass newjoinClass = new JoinClass(id: 0,codeJoinClass: codeJoinClassControler.text, idstudent: user.idstudent);
                                          JoinClass joinClass = await joinClasss(joinClassURL,body:newjoinClass.toMap());
                                          print(joinClass.codeJoinClass);
                                          print(joinClass.idstudent);
                                        },
                                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container( 
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.lightBlueAccent,
                                                Colors.tealAccent,
                                                // Colors.lightGreenAccent,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),              
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text(
                                            '  Join Class  ',
                                            style: TextStyle(fontSize: 20,color: Colors.white),    
                                          ),
                                          )
                                      ),
                                      SizedBox(height: ScreenUtil.getInstance().setHeight(15),),
                                     // Text("OR"),
                                  ],
                                ),
                              ),                   
                            )
                          );
                        }
          ),       
        ],       
      ),
      //Drawer
      drawer: Drawer(  
        child: Container(
          color: Colors.amber[numColor1],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                
                child: Container( 
                  width: 30.0,
                  height: 30.0,
                  child: Padding( 
                    padding: EdgeInsets.all(30),
                    child: CircleAvatar( 
                      backgroundImage: NetworkImage(''),
                      minRadius: 90,
                      maxRadius: 180,
                      child: Text(this.user.firstname,
                                 style: TextStyle( 
                                   color: Colors.white70
                                 ), 
                      ),
                      backgroundColor: Colors.greenAccent,
                    ), 
                  ),
                ),
                decoration: BoxDecoration(  
                  color: Colors.amber[numColor2],
                ),             
              ),
             
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Student Information'),
                
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('LogOut'),
                onTap: () async {  
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('Index');
                  print(prefs.getInt('Index'));
                  Navigator.of(context).pushNamed("/" + login); },
              ),
              ListTile( 
                leading: Icon(Icons.close),
                title: Text("close"),
                onTap: (){exit(0);},
              )
              ],
            ),
          ),
        ),


      // Grid Layout
      body: classListView.build(context,this.user),
      backgroundColor: Colors.amber[numColor1], 
     
    );
  }
}