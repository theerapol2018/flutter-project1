// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'main.dart';


// var xText = " ";

// TextEditingController _usernameController = TextEditingController();
//   var _passwordController = TextEditingController();


// class FormLogin extends StatelessWidget {
  
//   initState() {
//     xText = _passwordController.text;
//     print(xText);
//   }

//   @override
  
//   Widget build(BuildContext context) {
//     //double height = MediaQuery.of(context).size.height;
//         return new Container(
         
//           width: double.infinity,
                
          
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black12,
//                     offset: Offset(0.0, 15.0),
//                     blurRadius: 15.0),
//                 BoxShadow(
//                     color: Colors.black12,
//                     offset: Offset(0.0, -10.0),
//                     blurRadius: 15.0),
//               ]),
//           child: Padding(
//             padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text("Login",
//                     style: TextStyle(
//                         fontSize: ScreenUtil.getInstance().setSp(45),
//                         fontFamily: "Poppins-Bold",
//                         letterSpacing: .6)),
//                 SizedBox(
//                   height: ScreenUtil.getInstance().setHeight(30),
//                 ),
//                 //Username
//                 Text("Username",
//                     style: TextStyle(
//                         fontFamily: "Poppins-Medium",
//                         fontSize: ScreenUtil.getInstance().setSp(26))),
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))
//                                                         , borderSide: BorderSide(color: Colors.amber,),
//                             ),
//                     focusedBorder:OutlineInputBorder(
//                                             borderSide: const BorderSide(color: Colors.teal, width: 2.0),
//                                             borderRadius: BorderRadius.circular(20.0),
//                               ),
//                       hintText: "username",
//                       hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      
//                 ),
//                 SizedBox(
//                   height: ScreenUtil.getInstance().setHeight(30),
//                 ),
//                 //Password
//                 Text("Password",
//                     style: TextStyle(
//                         fontFamily: "Poppins-Medium",
//                         fontSize: ScreenUtil.getInstance().setSp(26))),
//                 TextField(
//                   obscureText: true,
//                    controller: _passwordController,
                   
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20.0))
//                                                         , borderSide: BorderSide(color: Colors.amber,),
//                             ),
//                     focusedBorder:OutlineInputBorder(
//                                             borderSide: const BorderSide(color: Colors.teal, width: 2.0),
//                                             borderRadius: BorderRadius.circular(20.0),
//                               ),
//                       hintText: "Password",
//                       hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
//                 ),
//                 SizedBox(
//                   height: ScreenUtil.getInstance().setHeight(20),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                   FlatButton( 
                      
                    
//                     child: Text("Sign Up",
//                       style: TextStyle( 
//                         color: Colors.green,
//                       ),  
//                     ),
//                     splashColor: Colors.amber,
//                     onPressed:(){
//                       // Navigator.of(context).pushNamed("/" + signup);
//                       print(_passwordController.text);
//                       initState();
//                       print(xText);

//                     },
//                 ),
//                 FlatButton(  
                      
                    
//                     child: Text("Forgot Password?",
//                       style: TextStyle( 
//                         color: Colors.blue,
//                         fontFamily: "Poppins-Medium",
                        
//                       ),  
//                     ),
//                     onPressed:(){
//                       Navigator.of(context).pushNamed("/"+ forgetpw);
//                     },
//                 ),
               
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// class UserCheck{
//   int id;
//   String username;
//   String password;

//   UserCheck(int id, String username, String password) {
//     this.id = id;
//     this.username = username;
//     this.password = password;
//   }
// }