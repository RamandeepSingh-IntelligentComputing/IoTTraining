
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersession_app/screen2.dart';

class screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    TextEditingController name=TextEditingController();
    TextEditingController collage=TextEditingController();

    return(
        Container(child:Center(child:Column(children: [
          Expanded(child: TextField(controller: name,),),
          Expanded(child:TextField(controller: collage,)),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>screen2(name.text,collage.text))
            );
          },child: Text('Next'),)
        ],)
          ))
    );
  }

}