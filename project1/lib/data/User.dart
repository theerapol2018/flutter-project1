

class User {
  int id;
  String firstname;
  String lastname;
  String idstudent;
  String branch;
  String email;
  List<Subjects> subjects;

  User({int id,String firstname, String lastname,String idstudent,String branch,String email, List<Subjects> subjects}) {
    this.id = id;
    this.firstname = firstname;
    this.lastname = lastname;
    this.idstudent = idstudent;
    this.branch = branch;
    this.email = email;
    this.subjects = subjects;
  }
 
  factory User.fromJson(Map<String, dynamic> json){
    var list = json['subjects'] as List;
    print(list.runtimeType);
    List<Subjects> subjectsList = list.map((i) => Subjects.fromJson(i)).toList();
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname:json['lastname'],
      idstudent: json['idstudent'],
      branch:json['branch'],
      email:json['email'],
      subjects: subjectsList
    );
  }
         

  Map toJson() {
    return {
      'id': id,
      'firstname': firstname, 
      'lastname': lastname, 
      'idstudent': idstudent, 
      'branch': branch, 
      'email': email, 
    };
  }
}

class Subjects{
 String subjectid;
 String sId;
 String sName;
 String sDescription;
 String sTeacher;

Subjects({String subjectid, String sId, String sName, String sDescription, String sTeacher}){
  this.subjectid = subjectid;
  this.sId = sId;
  this.sName = sName;
  this.sDescription = sDescription;
  this.sTeacher = sTeacher;
}
 factory Subjects.fromJson(Map<String, dynamic> json){
   return Subjects(
    subjectid:json['subjectid'],
    sId: json['sId'],
    sName: json['sName'],
    sDescription: json['sDescription'],
    sTeacher: json['sTeacher']
   );
  }

Map tojson(){
  return {
      'subjectid': subjectid,
      'sId': sId, 
      'sName': sName, 
      'sDescription': sDescription, 
      'sTeacher': sTeacher, 
  };
}

}