import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class CreateUserLogin{
  final int id;
  final String username;
  final String password;

  CreateUserLogin({this.id, this.username, this.password});

  factory CreateUserLogin.fromJson(Map<String, dynamic> json){
    return CreateUserLogin(
      id : json['id'],
      username : json['username'],
      password : json['password'],
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    return map;
  }
 

}

Future<CreateUserLogin> createuserLogine(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return CreateUserLogin.fromJson(json.decode(response.body));
  });
}