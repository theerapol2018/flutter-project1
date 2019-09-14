import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto/crypto.dart';
import 'data/Post.dart';
import 'main.dart';


  TextEditingController firstNameControler = new TextEditingController();
  TextEditingController lastNameControler = new TextEditingController();
  TextEditingController idStudentControler = new TextEditingController();
  TextEditingController branchControler = new TextEditingController();
  TextEditingController emailControler = new TextEditingController();
  TextEditingController usernameControler = new TextEditingController();
  TextEditingController passwordControler = new TextEditingController();
 




class SignUp extends StatelessWidget {
  static const String routeName = "/signup";
   static final postUserURL = 'https://jsonflutter.herokuapp.com/user';

  @override 
  Widget build(BuildContext context){
     ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
     ScreenUtil.instance = ScreenUtil(width: 500, height: 800, allowFontScaling: true);


    return Scaffold(

       appBar: AppBar(
        centerTitle: true ,
        title: Text("Sign Up"),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amber[numColor],
      body: Container(
        child: Center(
          child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FormSignUp(),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(25),),
                      InkWell(
                        child: Container(
                          //margin: const EdgeInsets.fromLTRB(80.0, 0.0, .0, 0.0),
                          width: ScreenUtil.getInstance().setWidth(200),
                          height: ScreenUtil.getInstance().setHeight(80),
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
                              onTap: () async { 
                                var bytes  = utf8.encode(passwordControler.text);
                                var digest = sha256.convert(bytes);
                                Post newPost = new Post( id: 0, firstname: firstNameControler.text, lastname: lastNameControler.text,
                                                          idstudent: idStudentControler.text, branch: branchControler.text, 
                                                          email: emailControler.text, username: usernameControler.text, password: digest.toString());
                                Post p = await createUsers(postUserURL,
                                    body: newPost.toMap());
                                print(p.firstname);
                              
                             
                                // Navigator.of(context).pushNamed("/" + homeclass);

                              },
                              child: Center(
                                child: Text("SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),                 
                )         
        
              ),
            ),
          ),
    );
  }
}



class FormSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 
        return new Container(
         
          
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(500),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.0),
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
          child: SingleChildScrollView(
                      child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
              child: Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[         
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Name",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: firstNameControler,
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      // textform("name", "name"),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(26),
                      ),
                      Text("Lastname",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: lastNameControler,
                        decoration: InputDecoration(
                            hintText: "Lastname",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Student ID",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: idStudentControler,
                        decoration: InputDecoration(
                            hintText: "EX : B59XXXXX",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Branch",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: branchControler,
                        decoration: InputDecoration(
                            hintText: "สาขาวิชา : Computer Engeneering",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("E-mail",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: emailControler,
                        decoration: InputDecoration(
                            hintText: "EX : B5907953@g.sut.ac.th",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Username",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: usernameControler,
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("New Password",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        controller: passwordControler,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
            ],
        ),
              ),

          ),
    );
  }
}