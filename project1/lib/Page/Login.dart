import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto/crypto.dart';
import 'package:project1/data/API.dart';
import 'package:project1/data/CreateUserLogin.dart';
import 'package:flutter/services.dart';
import 'package:project1/data/Subjects.dart';
import 'package:project1/data/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../main.dart';
import 'HomeClass.dart';



TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class Login extends StatefulWidget{
  static const String routeName = "/login";
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login>{

  loginTo() async {

    var bytes  = utf8.encode(_passwordController.text);
    var digest = sha256.convert(bytes);        
    CreateUserLogin newCreateLogin = new CreateUserLogin(/*id: 0,*/ username: _usernameController.text, password: digest.toString());
    CreateUserLogin c = await createuserLogine(urlLogin,body: newCreateLogin.toMap());

    // API.getUsersLogin().then((response) {   
    //   Iterable list = json.decode(response.body);
    //   users = list.map((model) => User.fromJson(model)).toList();
    //   print(users[0].idstudent);
    //   API.getSubject(users[0].idstudent).then((response) {   
    //     Iterable list = json.decode(response.body);
    //     subjectName = list.map((model) => Subjects.fromJson(model)).toList();
    //   });
    // });
    
    if(loginState != null ){
            // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeClass(user: users[0])),);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("User", users[0].id);
            print(prefs.getString("User"));

            API.getUsersLogin(users[0].id).then((response) {   
            Iterable list = json.decode(response.body);
            users = list.map((model) => User.fromJson(model)).toList();
            print(users[0].idstudent);

            API.getSubject(users[0].idstudent).then((response) {   
              Iterable list = json.decode(response.body);
              subjectName = list.map((model) => Subjects.fromJson(model)).toList();
            });
            
            Future.delayed(const Duration(milliseconds: 300), () {

              setState(() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeClass(user: users[0])),);
              });

            });


      });
            

    }  
  //   startTime() async {
  //   var _duration = new Duration(seconds: 10);
  //   return new Timer(_duration,nextPage);
  //   }
  //  void nextPage() {
  //         Navigator.push(context,MaterialPageRoute(builder: (context) => HomeClass(user: users[0],)),);
  //     }
  //   }

  }
  

  @override 
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 500, height: 1200, allowFontScaling: true);
    // print("Login===> " + xUser);
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return new Scaffold(
      
      backgroundColor: Colors.amber[numColor] ,
      // resizeToAvoidBottomPadding: false ,
      body: Center( 
        child: SingleChildScrollView(
          child: Column( 
            children: <Widget>[ 
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Container(
                      child: Text("SUT",
                          style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                         
 
                          )
                      )
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                  child: Padding( 
                    padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 0.0),
                    child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: ScreenUtil.getInstance().setHeight(50),),
                        FormLogin(),
                        SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                        InkWell(
                          child: Container(
                           // margin: const EdgeInsets.fromLTRB(0.0, 0.0, .0, 0.0),
                            width: ScreenUtil.getInstance().setWidth(200),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFFFF1744),
                                  Color(0xFF00BCD4)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                // onTap: () { Navigator.of(context).pushNamed("/" + homeclass); },
                                // onTap: () { getData(); },
                                onTap: (){ loginTo();},
                                child: Center(
                                  child: Text("SIGNIN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 18,
                                              letterSpacing: 1.0)
                                    ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )    
              )  
            ],
          ),
        )
      ),
    );
  }
}



class FormLogin extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;


        return new Container(
         
          width: double.infinity,
                
          
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 15.0),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, -10.0),
                    blurRadius: 15.0),
              ]),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Login",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(height: ScreenUtil.getInstance().setHeight(30),),
                //Username
                
                Text("Username",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextFormField(
                  
                  // autofocus: true,
                  textInputAction: TextInputAction.done,
                  
                  //  validator: (value) {
                  //       if (value.isEmpty) {
                  //         return 'Please enter Username';
                  //       }
                  //       return null;
                  //     },
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.amber,),),
                    focusedBorder:OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                       borderRadius: BorderRadius.circular(20.0),),
                    hintText: "username",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                     
                ),
                SizedBox(height: ScreenUtil.getInstance().setHeight(30),),
                //Password
                Text("Password",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  obscureText: true,
                
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))
                                                        , borderSide: BorderSide(color: Colors.amber,),
                            ),
                    focusedBorder:OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                                            borderRadius: BorderRadius.circular(20.0),
                              ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(height: ScreenUtil.getInstance().setHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  FlatButton( 
                      
                    
                    child: Text("Sign Up",
                      style: TextStyle( 
                        color: Colors.green,
                      ),  
                    ),
                    splashColor: Colors.amber,
                    onPressed:(){
                      Navigator.of(context).pushNamed("/" + signup);
                    },
                ),
                FlatButton(  
                      
                    
                    child: Text("Forgot Password?",
                      style: TextStyle( 
                        color: Colors.blue,
                        fontFamily: "Poppins-Medium",
                        
                      ),  
                    ),
                    onPressed:(){
                      Navigator.of(context).pushNamed("/"+ forgetpw);
                    },
                ),
               
              ],
            )
          ],
        ),
      ),
    );
  }
}
