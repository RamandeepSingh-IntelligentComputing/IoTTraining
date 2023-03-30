import 'package:flutter/material.dart';
import 'package:fluttersession_app/scaffoldWidget.dart';

import 'StatefullWidgetBasic.dart';
import 'loginPage.dart';

void main() {
  runApp(MainApp());
}

Widget MainApp(){
  return(
     MaterialApp(
       debugShowCheckedModeBanner: false,
      home: BasicStatefullWidget("Basic Statefull Demo "),
    )
  );
}

Widget login(){
  return(
  Expanded(
    child:Column(
      children: [
        dummyRow("User Id"),
        dummyRow("Pass"),
        Align(alignment:Alignment.centerRight,child:ElevatedButton(onPressed:()=>{}, child: Text("Login")))
      ],
    ) ,)
  );
}

Widget dummyRow(String txt){
  return(
      Material(
        child:Padding(padding: EdgeInsets.fromLTRB(20, 0, 150, 0),
          child:Row(
            children: [
              Icon(Icons.account_balance),
              Text("$txt"),
              Expanded(child: TextField())
          ],
        ) ,))
  );
}