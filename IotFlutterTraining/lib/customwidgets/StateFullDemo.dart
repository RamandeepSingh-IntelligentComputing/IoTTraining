import 'package:flutter/material.dart';

class statefullDemo extends StatefulWidget {
  _statefulldemostate createState() => _statefulldemostate();
}

class _statefulldemostate extends State<statefullDemo> {

  String title = "Awefull Demo";

  void updateTitle()
  {
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
              color: Colors.red,
              child: TextField(
                decoration: InputDecoration(labelText: "Enter Titile"),
              onChanged:(text)=>{title = text},)),
        ),
          ElevatedButton(onPressed: updateTitle,child: Text("Click"),)
        ])));
  }
}



