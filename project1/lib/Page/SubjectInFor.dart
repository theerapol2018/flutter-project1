import 'package:flutter/material.dart';
import 'package:project1/fakeData/User.dart';




class SubjectInFor extends StatefulWidget{
   static const String routeName = "/subjectinfor";

  @override
  _SubjectInForState createState() => _SubjectInForState();
}

class _SubjectInForState extends State<SubjectInFor> {
  List<User> users;  //FakeData
  List<User> selectedUsers;
  bool sort;
@override
  void initState() {  //FakeData
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
   onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }
 
  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }
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
             
             DataTable( 
              // sortAscending: sort,
              // sortColumnIndex: 0,
               columns:[ 
                DataColumn(
                    label: Text("FIRST NAME"),
                    numeric: false,
                    tooltip: "This is First Name",
                ),
                DataColumn(
                  label: Text("LAST NAME"),
                  numeric: false,
                  tooltip: "This is Last Name",
                )
                  
      
               ],
               rows: [],
            //    rows:users
            // .map(
            //   (user) => DataRow(
            //           selected: selectedUsers.contains(user),
            //           onSelectChanged: (b) {
            //             print("Onselect");
            //             onSelectedRow(b, user);
            //           },
            //           cells: [
            //             DataCell(
            //               Text(user.firstName),
            //               onTap: () {
            //                 print('Selected ${user.firstName}');
            //               },
            //             ),
            //             DataCell(
            //               Text(user.lastName),
            //             ),
            //           ]),
            // )
            // .toList(),
                )
              
          
            ],
          ),
        ),
      )



    );
  }

 
}