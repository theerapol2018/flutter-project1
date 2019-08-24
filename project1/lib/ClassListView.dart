import 'package:flutter/material.dart';
import 'package:project1/main.dart';

class ClassListView {

  
  Card getStructuredGridCell(name,image){
    return Card( 
      elevation: 1.5,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[ 
          // Image(image: AssetImage('data_repo/img/' + image)),
          //   Center(
          //     child: Text(name),
          //   )
          // Text(name),
          ButtonTheme(
            minWidth: 200.0,
            height: 143.0,
            child: FlatButton( 
                child: Text(name,
                  style: TextStyle( 
                    color: Colors.greenAccent,
                    fontFamily: "Poppins-Medium",
                    fontSize: 15,
                    letterSpacing: 1.0
                    
                  ),  
                ),
                onPressed:(){   },
            ),
          ),
        ],
      ),
    );
  }

 GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(2.0),
      crossAxisCount: 3,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("Computer Engineering", " "),
        getStructuredGridCell("OS", "social/twitter.png"),
        // getStructuredGridCell("Instagram", "social/instagram.png"),
        // getStructuredGridCell("Linkedin", "social/linkedin.png"),
        // getStructuredGridCell("Google Plus", "social/google_plus.png"),
        // getStructuredGridCell("Launcher Icon", "ic_launcher.png"),
      ],
    );
  }
}

  


