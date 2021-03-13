import 'dart:convert';

import 'package:apiflutter/Models/User.dart';
import 'package:apiflutter/Models/Users.dart';
import 'package:http/http.dart' as http;

class Services{
  static const baseURl = "https://jsonplaceholder.typicode.com/users";

  // ignore: missing_return
  static Future<Users> getUsers() async
  {
    try{
      final respond = await http.get(baseURl);
      if(200 == respond.statusCode){
        return parseUsers(respond.body);
      }
      else{
        return Users();
      }
    }
    catch(e){
      print("Error "+e.toString());
      return Users();
    }
  }

  // ignore: missing_return
  static Users parseUsers(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<User> users = parsed.map<User>((json) => User.fromJson(json)).toList();
    Users u = Users();
    u.users = users;
    return u;
  }
}