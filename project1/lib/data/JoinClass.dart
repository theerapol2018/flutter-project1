import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class JoinClass{
  final int id;
  final String codeJoinClass;
  final String idstudent;

  JoinClass({
    this.id,
    this.codeJoinClass,
    this.idstudent
  });

  factory JoinClass.fromJson(Map<String, dynamic> json){
    return JoinClass(
      id : json['id'],
      codeJoinClass: json['codeJoinClass'],
      idstudent: json['idstudent']
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map["codeJoinClass"] = codeJoinClass;
    map["idstudent"] = idstudent;
    return map;
  }

}

Future<JoinClass> joinClasss(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return JoinClass.fromJson(json.decode(response.body));
  });
}