import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'FormLogin.dart';
import 'main.dart';
import 'package:flutter/services.dart';




class Login extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 500, height: 1200, allowFontScaling: true);

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
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: ScreenUtil.getInstance().setHeight(50),),
                        FormLogin(),
                        SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(80.0, 0.0, .0, 0.0),
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
                                onTap: () {},
                                child: Center(
                                  child: Text("SIGNIN",
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
              )  
            ],
          ),
        )
      ),
    );
  }
}

