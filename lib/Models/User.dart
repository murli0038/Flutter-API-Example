import 'package:apiflutter/Models/Address.dart';
import 'package:apiflutter/Models/Company.dart';

class User{
  User();

  num id;
  String name;
  String username;
  String email;
  var address;
  String phone;
  String website;
  var company;

  factory User.fromJson(Map<String,dynamic> json) {
    return User()
        ..id = json['id'] as num
        ..name = json['name'] as String
        ..username = json['username'] as String
        ..email = json['email'] as String
        ..address = json['address'] as Map
        ..phone = json['phone'] as String
        ..website = json['website'] as String
        ..company = json['company'] as Map;
  }

  Map<String, dynamic> toJson(User instance) => <String, dynamic> {
    'id': instance.id,
    'name': instance.name,
    'username': instance.username,
    'email': instance.email,
    'address':  instance.address,
    'phone': instance.phone,
    'website': instance.website,
    'company': instance.company
  };
}