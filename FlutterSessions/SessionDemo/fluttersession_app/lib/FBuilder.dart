
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersession_app/jsonExample.dart';

import 'globalDef.dart';

class FBuilder extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    StudentData s1 = StudentData.empty();
    print(s1.getData().toString());
    //getStudentList
    s1.getStudentList().forEach((element) {print(element.toString());});

    return(
      FB(context)
    );
  }
}

Widget FB(BuildContext context)
{
  return(
  FutureBuilder(builder:(context,snapshot)
  {
    if(snapshot.connectionState == ConnectionState.done || snapshot.hasData){
      final List<String> stl = snapshot.data as List<String>;
        return(
            ListView(children:
            List.generate(stl.length, (index) => Text(stl[index])))
        );
      }
    else if(snapshot.connectionState == ConnectionState.waiting){
      return Center(child: CircularProgressIndicator());
    }
    else
      return Center(child:Text("State Unknown"));
  },
    future: FutureMsg(),
  )
  );
}