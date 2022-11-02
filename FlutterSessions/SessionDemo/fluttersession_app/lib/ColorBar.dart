
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorBar extends StatelessWidget{

  ColorBar({required this.Red,required this.Blue,required this.Green});
  VoidCallback Red;
  VoidCallback Blue;
  VoidCallback Green;

  void setRed(){
    Red();
  }
  void setBlue(){
    Blue();
  }
  void setGreen(){
    Green();
  }
  @override
  Widget build(BuildContext context) {
  return(
  Container(child:Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(onPressed: ()=>setRed(), child: Text("Red")),
      ElevatedButton(onPressed: ()=>setGreen(), child: Text("Green")),
      ElevatedButton(onPressed: ()=>setBlue(), child: Text("Blue")),

    ],
  ))
  );

  }

}