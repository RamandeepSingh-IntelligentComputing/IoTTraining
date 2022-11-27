
import 'package:flutter/material.dart';
import 'package:fluttersession_app/main.dart';

import 'globalDef.dart';

class FutureDemo extends StatefulWidget{
  String msg = "Empty Msg";
  _FutureDemoState createState() => _FutureDemoState();
}

//-----------This returns Future List<String> object-----
//FutureMsg();

class _FutureDemoState extends State<FutureDemo>{

  @override
  initState()
  {
    super.initState();
    FutureMsg().then((value) => {
      setState(() {
        stl = value;
      })
    });
  }

  List<String> stl = List.generate(1, (index) => "Empty");

  @override
  Widget build(BuildContext context) {
    return(
        ListView(children:
        List.generate(stl.length, (index) => Text(stl[index])))
    /*Container(
      child:Column(
        children: [

          //Center(child:Text(" ")),
          //ElevatedButton(onPressed: ()=>{ }, child: Text("Update"))
        ],
      )
     )*/
    );
  }
}


