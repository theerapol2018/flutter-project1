import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class JoinClass{
  // final int id;
  String codeJoinClass;
  String idstudent;

  JoinClass({
    // this.id,
    this.codeJoinClass,
    this.idstudent
  });

  factory JoinClass.fromJson(Map<String, dynamic> json){
    return JoinClass(
      // id : json['id'],
      codeJoinClass: json['Jpassword'],
      idstudent: json['JSID']
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map['Jpassword'] = codeJoinClass;
    map['JSID'] = idstudent;
    return map;
  }

}

Future<JoinClass> joinClasss(String url, {Map body}) async {
  print(body);
  return http.post(url, body: json.encode(body))
  .then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
     print(json.decode(response.body));
    // return JoinClass.fromJson(json.decode(response.body));
  });
}