import 'package:flutter/material.dart';
import 'package:iotfluttertraining/customwidgets/CustomWidgets.dart';

class lvHome extends StatelessWidget{
  var childList = List<DetailWidget>.generate(1000, (index) =>
      DetailWidget(name:"Test ${index+1}", init:"T${index+1}"));

  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text("List View Demo"),),
        body: ListView(children: childList,)
    ));
  }
}

class DetailWidget extends StatelessWidget{
  String name="";
  String init = "";
  DetailWidget({@required this.name="",@required this.init=""});
  void serveSnack(BuildContext cntx){
    ScaffoldMessenger.of(cntx).showSnackBar(
        SnackBar(content: Text("Welcome ${name}"),
            duration:Duration(seconds: 1) ,));
  }

  @override
  Widget build(BuildContext context) {
    return(SizedBox(height: 100,
     child:Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
      GestureDetector(onTap:(){serveSnack(context);},
          child:CircleAvatar(radius:40, child: Text(init),)),
      Text(name,style: TextStyle(fontSize: 28,color: Colors.blueGrey),)
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

  void updateStudentList(){
    studentList.add(DetailWidget(name: name.text, init: initials.text));
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
        ElevatedButton(onPressed:updateStudentList, child: Text("Click")),
        Expanded(child:ListView.builder(itemCount: studentList.length,
        itemBuilder: (context,index) {
          return DetailWidget(name: studentList[index].name, init: studentList[index].init);
          },)),
      ],
      )

    ));
  }

}


