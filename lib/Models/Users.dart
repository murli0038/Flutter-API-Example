import 'package:apiflutter/Models/User.dart';

class Users{
  Users();

  List<User> users;

  factory Users.fromJson(Map<String,dynamic> json) {
    return Users()
        ..users = json['users'] as List<User>;
  }

  Map<String, dynamic> toJson(Users instance) => <String, dynamic> {
    'users' : instance.users
  };

  static Users filterList(Users users,String filterString){
    Users temp = users;
    List<User> _users = temp.users.where((u) => (u.name.toLowerCase().contains(filterString.toLowerCase()))).toList();
    users.users = _users;
    return users;
  }

}