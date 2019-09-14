
class User {
  int id;
  String firstname;
  String lastname;
  String idstudent;
  String branch;
  String email;
  String username;
  String password;

  User({int id,String firstname, String lastname,String idstudent,String branch,String email, String username, String password}) {
    this.id = id;
    this.firstname = firstname;
    this.lastname = lastname;
    this.idstudent = idstudent;
    this.branch = branch;
    this.email = email;
    this.username = username;
    this.password = password;
  }

  User.fromJson(Map json)
      : id = json['id'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        idstudent = json['idstudent'],
        branch = json['branch'],
        email = json['email'],
        username = json['username'],
        password = json['password'];

  Map toJson() {
    return {'id': id,'firstname': firstname, 'lastname': lastname, 'idstudent': idstudent, 'branch': branch, 'email': email, 'username': username, 'password': password};
  }
}

// Future<User> createUser(String url, {Map body}) async {
//   return http.post(url, body: body).then((http.Response response) {
//     final int statusCode = response.statusCode;

//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       throw new Exception("Error while fetching data");
//     }
//     return User.fromJson(json.decode(response.body));
//   });
// }