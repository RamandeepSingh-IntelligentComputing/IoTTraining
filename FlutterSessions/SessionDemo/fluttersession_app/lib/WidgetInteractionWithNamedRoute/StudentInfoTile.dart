import 'package:flutter/material.dart';

class StudentInfoTile extends StatelessWidget{
  String Name;
  String Course;

  StudentInfoTile(this.Name,this.Course);

  @override
  Widget build(BuildContext context) {
    return(ListTile(
      leading: CircleAvatar(child:Text(Name[0])),
      title: Text(Name),
      subtitle: Text(Course),
      ));
  }

}