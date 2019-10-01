import 'package:flutter/material.dart';




class SubjectInFor extends StatefulWidget{
   static const String routeName = "/subjectinfor";

  @override
  _SubjectInForState createState() => _SubjectInForState();
}

class _SubjectInForState extends State<SubjectInFor> {
@override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar( 
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Center( 

        child: Container(
          margin: const EdgeInsets.all(50.0),
          child: Column( 
            children: <Widget>[ 
             
              
          
            ],
          ),
        ),
      )



    );
  }

 
}