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
  final String username;
  final String password;

 
  CreateUser({this.id,
    this.firstname,
    this.lastname,
    this.idstudent,
    this.branch,
    this.email,
    this.username,
    this.password});
 
  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
        id : json['id'],
        firstname : json['firstname'],
        lastname : json['lastname'],
        idstudent : json['idstudent'],
        branch : json['branch'],
        email : json['email'],
        username : json['username'],
        password : json['password'],
    );
  }
 
  Map toMap() {
    var map = new Map<String, dynamic>();
    // map["id"] = id;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["idstudent"] = idstudent;
    map["branch"] = branch;
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;
 
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