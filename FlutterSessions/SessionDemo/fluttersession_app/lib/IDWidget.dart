
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IDWidget extends StatelessWidget{
  //VoidCallback incr;
  //VoidCallback decr;
  int count = 0;
  final Function(String) display;

  //IDWidget({required this.incr,required this.decr});
  IDWidget({required this.display});

  incr(){
    count++;
    display(count.toString());
    print("Incr Called");
  }

  decr(){
    count--;
    display(count.toString());
    print("decr called");
  }

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