import 'package:flutter/material.dart';
import 'package:iotfluttertraining/customwidgets/CustomWidgets.dart';
import 'package:iotfluttertraining/globaldefinations/globaldefinations.dart';
import 'DetailView.dart';

/*class lvHome extends StatelessWidget{
  var childList = List<DetailWidget>.generate(1000, (index) =>
      DetailWidget(name:"Test ${index+1}", init:"T${index+1}"));

  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text("List View Demo"),),
        body: ListView(children: childList,)
    ));
  }
}*/

class DetailWidget extends StatelessWidget{
  studentDetails student;

  DetailWidget({required this.student,});

  void serveSnack(BuildContext cntx) async{

    Navigator.push(cntx,
        MaterialPageRoute(builder: (cntx)=>DetailView(),
        settings: RouteSettings(arguments: student))).then((value) => {
      ScaffoldMessenger.of(cntx).showSnackBar(
          SnackBar(content: Text("Welcome ${student.name}.You've been $value"),
            duration:Duration(seconds: 3) ,))
    });
  }

  @override
  Widget build(BuildContext context) {
    return(SizedBox(height: 100,
     child:Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
      GestureDetector(onTap:(){serveSnack(context);},
          child:CircleAvatar(radius:40, child: Text(student.init),)),
      Text(student.name,style: TextStyle(fontSize: 28,color: Colors.blueGrey),)
    ],))
    );
  }
}

class entryForm extends StatefulWidget{

  _entryFormState createState()=> _entryFormState();
}

class _entryFormState extends State<entryForm>{

  var studentList = <DetailWidget>[];

  TextEditingController name = TextEditingController();
  TextEditingController initials = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController branch = TextEditingController();

  void updateStudentList(){
    studentList.add(DetailWidget(student: studentDetails.withData(name:name.text,
        init: initials.text,branch: branch.text,college: college.text, pro: null),));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      appBar: AppBar(title: Text("Entry Form"),),
      body:Column(children: [
        TextField(decoration: InputDecoration(labelText: "Enter Name"),
            controller: name,),
        TextField(decoration: InputDecoration(labelText: "Enter Initials"),
            controller: initials,),
        TextField(decoration: InputDecoration(labelText: "Enter College"),
          controller: college,),
        TextField(decoration: InputDecoration(labelText: "Enter Branch"),
          controller: branch,),

        ElevatedButton(onPressed:updateStudentList, child: Text("Click")),
        Expanded(child:ListView.builder(itemCount: studentList.length,
        itemBuilder: (context,index) {
          return DetailWidget(student: studentDetails.withData(name: studentList[index].student.name,
              init:studentList[index].student.init,
              college: studentList[index].student.college,
              branch: studentList[index].student.branch, pro: null));
          },)),
      ],
      )

    ));
  }

}


