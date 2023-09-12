
class User {
  late int id;
  late String name;
  late String email;
  late String photo;
  late String phone;
  late String active;
  late String token;
  late String password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    phone = json['phone'];
    active = json['active'];
    token = json['token'];
  }

}