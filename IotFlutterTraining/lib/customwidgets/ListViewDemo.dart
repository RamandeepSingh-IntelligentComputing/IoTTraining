import 'package:flutter/material.dart';

class lvHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text("List View Demo"),),
        body: ListView(children: [
          DetailWidget("Test1","T1"),
          DetailWidget("Test2","T2"),
        ],)
    ));
  }
}

class DetailWidget extends StatefulWidget{
  String name="";
  String init = "";
  DetailWidget(String nm,String ini){
    name = nm;
    init = ini;
  }

  _DetailWidgetState createState()=> _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget>{
  @override
  Widget build(BuildContext context) {
    return(
    Row(children: [
      CircleAvatar(child: Text(widget.init),),
      Text(widget.name,style: TextStyle(fontSize: 28,color: Colors.amber),)
    ],)
    );
  }
}




