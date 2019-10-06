import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:project1/data/DataCheck.dart';
import 'package:project1/main.dart';
import 'Camera.dart';


 List<CameraDescription> cameras;
  
class Subject extends StatefulWidget{
   static const String routeName = "/subject";
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> { 

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
                    // Navigator.push(context,MaterialPageRoute(builder: (context) => SubjectInFor()));
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
                          Text("scan"),
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

  Future _incrementCounter() async{
    _counter= await FlutterBarcodeScanner.scanBarcode("#11f73f", "Cancel", false, ScanMode.DEFAULT);
    setState(() {_value = _counter;});
    DataCheck newSend = new DataCheck(dataCheck: _value);
    DataCheck news = await send(dateCheck,body: newSend.toMap());    
      // if(_value != "-1"){
      //   openCamera();
      // }
      // dataCheck = _value;
  }
          
    openCamera() async {
      final cameras = await availableCameras();
      // final  firstCamera = cameras.first;
      // final  frontCamera = cameras[1];
        Navigator.push(context,MaterialPageRoute(builder: (context) => TakePictureScreen(camera: cameras)),);
    }
   
   checkOpen() {
     print(scanState);
      if(scanState != null){
        openCamera();
      }
   }
      
         
      
  
}