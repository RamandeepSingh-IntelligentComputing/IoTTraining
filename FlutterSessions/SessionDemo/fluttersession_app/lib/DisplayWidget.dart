

import 'package:flutter/cupertino.dart';

class DisplayWidget extends StatefulWidget{
  _DisplayWidgetState cws = _DisplayWidgetState();
  _DisplayWidgetState createState() => cws;
  String msg="";
}

class _DisplayWidgetState extends State<DisplayWidget>{

  display(String msg){
    setState(() {
     widget.msg = msg;
    });
    print("Display called");
  }

  @override
  Widget build(BuildContext context) {
    return(
        Container(
            child:Center(child:Text("${widget.msg}",style: TextStyle(fontSize: 38),))
        )
    );
  }

}