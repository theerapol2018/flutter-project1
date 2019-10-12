import 'package:flutter/material.dart';
import 'package:project1/main.dart';
 String date = " ";
class SubjectInFor extends StatefulWidget {
  static const String routeName = "/subjectinfor";
  final  attendance;
 

  const SubjectInFor({Key key, this.attendance}) : super(key: key);
  @override
  Episode5State createState() {   
    
    // for (var j = 0 ;j < attendance.authenStudent.length;j++){
    //   for (var i = 0 ;i < 10;i++){
    //      date = date + attendance.authenStudent[j].data[i];
    //  print(date);
    //  print("555555555");
    //   }
    
    // }
    return new Episode5State();
  }
}
  List<Map<String, IconData>> icon = [
    {
      'false': Icons.close ,
      'true': Icons.done,
    }, 
];
class Episode5State extends State<SubjectInFor> {
  var status;
 
 


  Widget bodyData() => DataTable(
     columns: <DataColumn>[
              DataColumn(
                
                label: Text("Date and Time",
                 style: TextStyle( 
                   color: Colors.black,
                   fontSize: 16.0,
                 )

                )
                
              ),
              DataColumn(
                label: Text("Attendance",
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 16.0,
                    
                  )
                ),
              ),
      ],
    rows: [
     
     
      for (var i = 0 ;i < widget.attendance.authenStudent.length;i++) 
         DataRow(
                
                cells: <DataCell>[
                  DataCell(Text(widget.attendance.authenStudent[i].data[0]+widget.attendance.authenStudent[i].data[1]
                  +widget.attendance.authenStudent[i].data[2]+widget.attendance.authenStudent[i].data[3]
                  +widget.attendance.authenStudent[i].data[4]+widget.attendance.authenStudent[i].data[5]+
                  widget.attendance.authenStudent[i].data[6]+widget.attendance.authenStudent[i].data[7]+
                  widget.attendance.authenStudent[i].data[8]+widget.attendance.authenStudent[i].data[9]
                  +widget.attendance.authenStudent[i].data[10]+widget.attendance.authenStudent[i].data[11])),
                  DataCell(Icon(icon[0][widget.attendance.authenStudent[i].stateAuthen.toString()]))
                
                ],
          ),
          
    ],
           
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Table"),
        backgroundColor: Colors.amber[numColor],
      ),
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Container(
            child: bodyData(),
          ),
        ),
      ),
    );
  }
}
