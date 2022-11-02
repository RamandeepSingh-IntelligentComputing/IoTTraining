
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IDWidget extends StatelessWidget{
  VoidCallback incr;
  VoidCallback decr;

  IDWidget({required this.incr,required this.decr});

  @override
  Widget build(BuildContext context) {
    return(
    Container( color:Colors.black26,
      child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: ()=>incr(), child: Text("Incr")),
          ElevatedButton(onPressed: ()=>decr(), child: Text("Decr"))
        ],
      )
    )
    );
  }

}