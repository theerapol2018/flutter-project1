import 'package:http/http.dart' as http;
import 'dart:async';
import '../main.dart';

class API {
  static Future getUsersformDB() {
    var urlname = "studentuser";
    var urlUsername = (url + urlname);
    return http.get(urlUsername);
  }
}

