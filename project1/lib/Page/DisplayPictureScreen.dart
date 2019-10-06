import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project1/data/Selfie.dart';
import 'package:project1/main.dart';




class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String studentId;
  final String image;
  final String qr;
  const DisplayPictureScreen({Key key, this.imagePath,this.studentId,this.image,this.qr}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: FutureBuilder<void>(
        // future: _initializeControllerFuture,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {   // ตัวอย่าง รอโหลด !!!
            return Image.file(File(imagePath),height: 1080,width: 1000,);
          // } else {
          //   return Center(child: CircularProgressIndicator());
          // }
        },
      ),
     floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {

          print(imagePath);
          print(studentId.toString());
          print(image);
          print(qr);
          var bytes = utf8.encode(image);
          String image64 = base64Encode(bytes);
          Selfie newSend = new Selfie(studentId: studentId,imageSelfie: image64,dataCheck: qr);
           Selfie news = await selfieQR(selfieqr,body: newSend.toMap());
        
        }
      ),
      // body: Center( 
      //   child: Column( 
      //     children: <Widget>[ 
      //       Image.file(File(imagePath)),
      //       FloatingActionButton( 
      //         child: Icon(Icons.send),
      //         onPressed: (){},
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  
}