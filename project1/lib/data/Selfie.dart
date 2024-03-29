import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class Selfie{
  String studentId;
  String imageSelfie;
  String dataCheck;
  
 

  Selfie({
    this.studentId,
    this.imageSelfie,
    this.dataCheck,
    
  });

  factory Selfie.fromJson(Map<String, dynamic> json){
    return Selfie(
      studentId : json['Csid'],
      imageSelfie: json['ImageSelfie'],
      dataCheck: json['AQRcode'],
      
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map['Csid'] = studentId;
    map['ImageSelfie'] = imageSelfie;
    map['AQRcode'] = dataCheck;
    
    return map;
  }

}

Future<Selfie> selfieQR(String url, {Map body}) async {
 print("Send: \\|/");
 print(body);
 print(json.encode(body));
 print(" ");
  return http.post(url, body: json.encode(body))
  .then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
     print("response: >>> \\|/");
     print(json.decode(response.body));
    
    // return JoinClass.fromJson(json.decode(response.body));
  });
}