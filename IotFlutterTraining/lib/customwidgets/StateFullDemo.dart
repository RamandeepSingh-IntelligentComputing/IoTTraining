import 'package:flutter/material.dart';

class statefullDemo extends StatefulWidget {
  _statefulldemostate createState() => _statefulldemostate();
}

class _statefulldemostate extends State<statefullDemo> {

  String title = "Awefull Demo";

  void updateTitle(String text)
  {
   setState(() {
     title = text;
   });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
              color: Colors.red,
              child: TextField(
                decoration: InputDecoration(labelText: "Enter Titile"),
              onChanged:updateTitle,)),
        )));
  }
}
