import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';



class Newq extends StatefulWidget{
   static const String routeName = "/nnn";

  @override
  _NewqState createState() => _NewqState();
}

class _NewqState extends State<Newq> {
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
                  onTap: () {
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

    _counter= await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true);

    setState(() {
      _value=_counter;
    });


  }
}