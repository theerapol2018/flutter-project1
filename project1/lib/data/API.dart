import 'package:http/http.dart' as http;
import 'dart:async';

var url = ("https://jsonflutter.herokuapp.com/");
class API {
  static Future getUsersformDB() {
    var urlname = "user";
    var urlUsername = (url + urlname);
    return http.get(urlUsername);
  }
}

