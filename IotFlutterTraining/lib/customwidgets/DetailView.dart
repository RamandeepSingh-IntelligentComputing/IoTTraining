
import 'package:flutter/material.dart';
import 'package:iotfluttertraining/globaldefinations/globaldefinations.dart';

class DetailView extends StatelessWidget{
  studentDetails student = studentDetails();

  DetailView();

  @override
  Widget build(BuildContext context) {

    student = ModalRoute.of(context)!.settings.arguments as studentDetails;

    return Material(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text("Welcome ${student.name}",style: TextStyle(color: Colors.purple,
       fontSize:28),),
      Text("College : ${student.college}",style: TextStyle(color: Colors.blueGrey,
          fontSize:22),),
      Text("Branch : ${student.branch}",style: TextStyle(color: Colors.blueGrey,
          fontSize:22),),
      ElevatedButton(onPressed: ()=>{Navigator.pop(context,"Good")}, child: Text("Good")),

      ElevatedButton(onPressed: ()=>{Navigator.pop(context,"Ahh Okiesh..!")}, child: Text("Not So Good"))
    ],
    ),

    );
  }

}
