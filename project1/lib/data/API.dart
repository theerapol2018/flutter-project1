import 'package:http/http.dart' as http;
import 'dart:async';
import '../main.dart';

class API {
  static Future getUsersformDB() {
    var urlUsername = (url2 + 'Student/info/'+ xUser);
    return http.get(urlUsername);
  }

 }

