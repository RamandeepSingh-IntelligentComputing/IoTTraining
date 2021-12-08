import 'package:flutter/material.dart';
import 'package:iotfluttertraining/globaldefinations/globaldefinations.dart';
import 'dart:convert';

class statefullDemo extends StatefulWidget {
  _statefulldemostate createState() => _statefulldemostate();
}

class _statefulldemostate extends State<statefullDemo> {

  String title = "Awefull Demo";

  void updateTitle()
  {
    var parsedJson = json.decode(StudentJson) as List;

    //studentDetails st = studentDetails.fromJson(parsedJson);

    List<studentDetails> stl = List.generate(parsedJson.length,
            (index) => studentDetails.fromJson(parsedJson[index]));

    print(stl);

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
              color: Colors.grey,
              child: TextField(
                decoration: InputDecoration(labelText: "Enter Titile"),
              onChanged:(text)=>{title = text},)),
        ),
          ElevatedButton(onPressed: updateTitle,child: Text("Click"),)
        ])));
  }
}



