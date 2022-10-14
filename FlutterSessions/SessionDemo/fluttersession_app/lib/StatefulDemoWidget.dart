
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StatefulDemoWidget extends StatefulWidget{

  State<StatefulDemoWidget> createState() => _StatefulWidgetDemoState();

}

class _StatefulWidgetDemoState extends State<StatefulDemoWidget>{
  Color c1 = Color.fromARGB(100, 255, 30, 255);
  Color c2 = Color.fromARGB(100, 25, 30, 255);
  Color c3 = Color.fromARGB(100, 255, 30, 25);
  String tstring = DateTime.now().toString();
  late final Timer timer;

  @override
  void initState() {
    // TODO: implement initState

    print("Timer updated");
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      update();
      print("Timer updated");
    });
    super.initState();
  }

  void update(){
    setState(() {
      //c1 = Color.fromARGB(100, 25, 30, 25);
      //c2 = Color.fromARGB(100, 25, 200, 155);
      //c3 = Color.fromARGB(100, 125, 30, 25);
      tstring = DateTime.now().toString();

    });
  }

  @override
  Widget build(BuildContext context){
    return(Container(child: Column(children: [
      Expanded(child: Container(color:c1)),
      Expanded(child: Container(color:c2)),
      Expanded(child: Container(color:c3)),
      Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
        ElevatedButton(onPressed: (){update();}, child: Text("Bule")),
        ElevatedButton(onPressed: (){update();}, child: Text("Red")),
        ElevatedButton(onPressed: (){timer.cancel();}, child: Text("Green")),
      ],),
      Center(child:Text(tstring,style: TextStyle(fontSize: 28),)),
    ],),));
  }
}