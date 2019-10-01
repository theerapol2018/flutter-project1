// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// import 'package:project1/Page/SubjectInFor.dart';
import 'Page//ForgotPW.dart';
import 'Page/SignUp.dart';


import 'Page/Login.dart';
// import 'Page/Subject.dart';
import 'Page/SplashScreen.dart';
import 'Page/Subject.dart';
import 'Page/SubjectInFor.dart';

var url = ("https://jsonflutter.herokuapp.com/");
String signup = "signup";
String forgetpw = "forgetpw";
String homeclass = "homeclass";
String login = "login";
String subject = "subject";
String subjectInFor = "subjectinfor";
String camera = "camera";
int numColor = 500, numColor1 = 50, numColor2 = 100;
int xIndex ;

void main()  {
 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // List<CameraDescription> cameras;

    return MaterialApp(
      
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
      // Set named routes
      SignUp.routeName: (BuildContext context) => SignUp(),
      ForgetPW.routeName: (BuildContext context) => ForgetPW(),
      Login.routeName:(BuildContext context) => Login(),
      Subject.routeName:(BuildContext context) => Subject(),
      SubjectInFor.routeName:(BuildContext context) => SubjectInFor(),
      // Camera.routeName:(BuildContext context) => Camera(cameras),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   primaryColor: Colors.white,
      //   canvasColor: Colors.white,
      //   appBarTheme: AppBarTheme(
      //     elevation: 0,
      //     color: Colors.white,
      //   )
      // ),
    );
  }
}
