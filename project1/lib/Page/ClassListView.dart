import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/Page/Subject.dart';
import 'package:project1/data/User.dart';
import '../main.dart';

class ClassListView {

  
  Card getStructuredGridCell(name,image,BuildContext context,User user){
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    
    return Card( 
      elevation: 5.0,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      color: Colors.limeAccent,
      child: InkWell(
        onTap: () {
          print("tapped");
          // Navigator.of(context).pushNamed("/" + subject);
          Navigator.push(context,MaterialPageRoute(builder: (context) => Subject(user: user,)));
        },
        child: Column(
          children: <Widget>[
            Text(name),
            FlutterLogo(),
          ],
        ),
        ),
    );   
  }

 GridView build(BuildContext context, User user) {
   
    print(subjectName.length);
    // print(subjectName[0].sName);r
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(2.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 0.5,
      
      children: <Widget>[
           for (int i = 0; i < subjectName.length; i++) 
        getStructuredGridCell(subjectName[i].sName, "",context,user)
      ],
    );
  }

 
  
 
}

  


