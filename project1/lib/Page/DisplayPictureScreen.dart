import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project1/data/Selfie.dart';
import 'package:project1/main.dart';
import 'package:project1/meterial/MyDialog.dart';


// bool _load = false;

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final String studentId;
  final String firstname;
  final String lastname;
  final String image;
  final String qr;
  const DisplayPictureScreen({Key key, this.imagePath,this.studentId,this.image,this.qr,this.firstname,this.lastname}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {

  //  DialogState _dialogState = DialogState.DISMISSED;

  // void _exportData() {
  //   setState(() => _dialogState = DialogState.LOADING);
  //   Future.delayed(Duration(seconds: 5)).then((_) {
  //     setState(() => _dialogState = DialogState.COMPLETED);
  //     Timer(Duration(seconds: 3), () => setState(() => _dialogState = DialogState.DISMISSED));
  //   });
  // }

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: FutureBuilder<void>(
        // future: _initializeControllerFuture,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {   // ตัวอย่าง รอโหลด !!!
            return Image.file(File(widget.imagePath),height: 1080,width: 1000,);
          // } else {
          //   return Center(child: CircularProgressIndicator());
          // }
        },
      ),
     floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {
          var bytes = utf8.encode(widget.image);
          String image64 = base64Encode(bytes);
          Selfie newSend = new Selfie(studentId: widget.studentId,imageSelfie: image64,dataCheck: widget.qr,firstName: widget.firstname,lastName: widget.lastname);
          Selfie news = await selfieQR(selfieqr,body: newSend.toMap());
          if (selfieState) {
            // showDialog(

            //   context: context,
            //   builder: (_) => new AlertDialog(
            //       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
            //       // title: new Text("Enter Code "),
            //       content: Container(
            //           height: 180.0, 
            //           child: Column(  
            //             children: <Widget>[ 
            //               SpinKitCircle(
            //                 color: Colors.amber,
            //                 size: 80.0,
            //               ),
            //             ],
            //           ),
            //         ),                   
            //       )
            //     );
          }
        
        }
      ),

    );
        
  

  }  
}
