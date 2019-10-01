import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class CreateUser {
  final int id;
  final String firstname;
  final String lastname;
  final String idstudent;
  final String branch;
  final String email;
  //  final String subjects;///////
  // final List<CreateSubjects>  subjects;/////////
  

 
  CreateUser({this.id,
    this.firstname,
    this.lastname,
    this.idstudent,
    this.branch,
    this.email,
    // this.subjects /////////
  });
 
  factory CreateUser.fromJson(Map<String, dynamic> json) {
    // var list = json['subjects'] as List;////////////////
    // List<CreateSubjects> subjectsList = list.map((i) => CreateSubjects.fromJson(i)).toList(); ///////
    return CreateUser(
        id : json['id'],
        firstname : json['firstname'],
        lastname : json['lastname'],
        idstudent : json['idstudent'],
        branch : json['branch'],
        email : json['email'],
        // subjects: json['subjects'] ///////////
        // subjects: subjectsList //////
    );
  }
 
  Map toMap() {
    var map = new Map<String, dynamic >();
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["idstudent"] = idstudent;
    map["branch"] = branch;
    map["email"] = email;
    //  map["subjects"] = subjects; //////////
 
    return map;
  }
}

Future<CreateUser> createUsers(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return CreateUser.fromJson(json.decode(response.body));
  });
}

// class CreateSubjects{
// //  final String subjectid;
// //  final String sId;
// //  final String sName;
// //  final String sDescription;
// //  final String sTeacher;
//  String subjectid;
//  String sId;
//  String sName;
//  String sDescription;
//  String sTeacher;

// // CreateSubjects({this.subjectid, this.sId, this.sName, this.sDescription, this.sTeacher, });
// CreateSubjects({String subjectid, String sId, String sName, String sDescription, String sTeacher}){
//   this.subjectid = null;
//   this.sId = null;
//   this.sName = null;
//   this.sDescription = null;
//   this.sTeacher = null;
// }

//  factory CreateSubjects.fromJson(Map<String, dynamic> json){
//    return CreateSubjects(
//     subjectid:json['subjectid'],
//     sId: json['sId'],
//     sName: json['sName'],
//     sDescription: json['sDescription'],
//     sTeacher: json['sTeacher']
//    );
//   }

// Map tojson(){
//   return {
//       'subjectid': subjectid,
//       'sId': sId, 
//       'sName': sName, 
//       'sDescription': sDescription, 
//       'sTeacher': sTeacher, 
//   };
// }

// }