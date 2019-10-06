import 'package:http/http.dart' as http;
import 'dart:async';
import '../main.dart';

class API {
  static Future getUsersformDB() {
    var urlUsername = (url2 + 'Student/info/'+ xUser);
    return http.get(urlUsername);
  }
static Future getSubject(String studentID){
  return http.get('http://fe60b4be.ap.ngrok.io/Student/subject/B5907953');
}

 }

