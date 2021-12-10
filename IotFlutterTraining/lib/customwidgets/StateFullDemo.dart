import 'package:flutter/material.dart';
import 'package:iotfluttertraining/globaldefinations/globaldefinations.dart';
import 'dart:convert';

class statefullDemo extends StatefulWidget {
  _statefulldemostate createState() => _statefulldemostate();
}

class _statefulldemostate extends State<statefullDemo> {

  String title = "Awefull Demo";
  List<studentDetails> stl = [];

  void updateTitle()
  {
    var parsedJson = json.decode(StudentJson) as List;

    //studentDetails st = studentDetails.fromJson(parsedJson);

    stl = List.generate(parsedJson.length,
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
          Expanded(child: ListView.builder(itemCount:stl.length,
            itemBuilder: (BuildContext context, int index) {
            return(studentInfoWidget(stl[index]));},
          )),
          ElevatedButton(onPressed: updateTitle,child: Text("Fetch Data"),)
        ])));
  }
}

class studentInfoWidget extends StatelessWidget{
  studentDetails student;

  studentInfoWidget(this.student);

  @override
  Widget build(BuildContext context) {
    return(Card(elevation: 10,shadowColor: Colors.red,
        child:ListTile(title: Text("${student.name}"),
          subtitle: Text("${student.course} - ${student.branch} at ${student.college}"),
          isThreeLine: true,
          leading: CircleAvatar(child: Text("${student.init}"),radius: 20,),)
      )
    );
  }

}

