import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:project1/data/DataCheck.dart';
import 'package:project1/data/User.dart';
import 'package:project1/main.dart';
import 'Camera.dart';
import 'SubjectInFor.dart';


List<CameraDescription> cameras;
User user2;

class Subject extends StatefulWidget{
   static const String routeName = "/subject";
  final User user ;
  Subject({Key key, @required this.user, }) : super(key: key);
  
  @override
  _SubjectState createState() => _SubjectState();
  
}

class _SubjectState extends State<Subject> {
 

 
 

  // final User user ;
  // _SubjectState({Key key, @required this.user, }) : super(key: key);

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
              GestureDetector(
                  onTap: () {
                    print("Card 1");
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectInFor()));
                    // Navigator.of(context).pushNamed("/" + camera);                    
                  },
                  child: Card(                    
                    elevation: 5.0,
                    child: Container(
                      width: 250,
                      height: 200,
                      child: Column(  
                        children: <Widget>[ ],
                      ),
                    ),

                  ),
              ),
              GestureDetector(
                  onTap: () async {
                    print("Card 2");
                     _incrementCounter();
                  },
                  child: Card(
                    
                    elevation: 5.0,
                    child: Container(
                      width: 250,
                      height: 200,
                      child: Column(  
                        children: <Widget>[ 
                          Text("scan>> "+widget.user.idstudent.toString()),
                          Text(_value),
                        ],
                      ),
                    ),
                  ),
              )   
            ],
          ),
        ),
      )
    );
  }

  String _counter,_value = "";
  String x ="AAAAAAAA";

  Future _incrementCounter() async{
    _counter= await FlutterBarcodeScanner.scanBarcode("#11f73f", "Cancel", true, ScanMode.DEFAULT);
    setState(() {_value = _counter;});
    if(_value != "-1"){
      
      DataCheck newSend = new DataCheck(dataCheck: _value);
      DataCheck news = await send(dateCheck,body: newSend.toMap());  
      print(scanState);
      if(scanState == "Success"){
      openCamera();
      }
    }
    
    
     
      // if(_value != "-1"){
      //   openCamera();
      // }
      
  }
          
    openCamera() async {
      final cameras = await availableCameras();
      // final  firstCamera = cameras.first;
      // final  frontCamera = cameras[1];
        Navigator.push(context,MaterialPageRoute(builder: (context) => TakePictureScreen(camera: cameras,user: widget.user,qr: _value,)),);
    }
   
   checkOpen() async{
     print(scanState);
      if(scanState == 200){
        openCamera();
      }
   }
      
         
      
  
}