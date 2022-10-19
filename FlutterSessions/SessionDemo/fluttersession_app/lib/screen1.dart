
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersession_app/screen2.dart';

import 'globalDef.dart';

class screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    TextEditingController name=TextEditingController();
    TextEditingController collage=TextEditingController();

    return(
        Container(child:Center(child:Column(children: [
          Expanded(child: TextField(controller: name,),),
          Expanded(child:TextField(controller: collage,)),
          Expanded(child:Text("Returned Data to be displayed here")),
          ElevatedButton(onPressed: () async {
            student s1 = student(name.text,collage.text);

            await Navigator.push(context,
                MaterialPageRoute(builder: (context)=>screen2(s1))
            );
           print("Returned Value ${s1.name}");

          },child: Text('Next'),)
        ],)
          ))
    );
  }

}