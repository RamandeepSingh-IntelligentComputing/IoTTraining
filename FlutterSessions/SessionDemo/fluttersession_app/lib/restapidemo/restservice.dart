
import 'dart:convert';

import 'package:http/http.dart' as http;

class users{
  int id;
  String name;
  String username;
  String email;

  users(this.id,this.name,this.username,this.email);

  factory users.fromJson(Map<String,dynamic> rec){
    return(users(rec['id'],
      rec['name'],
      rec['username'],
      rec['email']
    ));
  }

}

class RestService{
  static Future<List<users>> getData() async{
    List<users> lst = [];
    final res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(res.statusCode == 200){

      final parsedData = json.decode(res.body) as List;

      parsedData.forEach((element){
        lst.add(users.fromJson(element));
      });
    }

  return lst;
  }
}