class Subjects{
 String sName;

Subjects({String sName}){
  this.sName = sName;
}
 factory Subjects.fromJson(Map<String, dynamic> json){
   return Subjects(
    sName: json['TSName'],
   );
  }

Map tojson(){
  return {
      'TSName': sName, 
  };
}

}
