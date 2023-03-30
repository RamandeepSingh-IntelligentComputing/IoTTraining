import "package:flutter/material.dart";

class scaffoldWidgetDemo extends StatelessWidget{

  List<Widget> swl = List<Widget>.generate(Student.getDefaultList().length, (index) =>
  ListTile(title: Text(Student.getDefaultList()[index].Name),
    subtitle: Text("${Student.getDefaultList()[index].Course} \n ${Student.getDefaultList()[index].RollNo}"),
    isThreeLine: true,
  ));

  @override
  Widget build(BuildContext context) {
  return(
    Scaffold(
      appBar: AppBar(title: Row(children: [Icon(Icons.account_box_outlined,size: 28,),Padding(padding:EdgeInsets.all(10), child:Text("Scaffold Demo")),],)),
      body:ListView(children: swl),
      floatingActionButton: FloatingActionButton(onPressed: ()=>{}, child:Icon(Icons.login)),

      drawer: Drawer(child:
      DrawerHeader(child:CircleAvatar(child:
        Text("R",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey,)
      )),

    )
  );
  }

}

class Student{

  Student({required this.Name,required this.RollNo,required this.Course});

  String Name;
  String RollNo;
  String Course;

  @override
  toString(){
    return("$Name with $RollNo studying $Course");
  }

  static List<Student> getDefaultList(){
    List<String> students = ["Aman Pandey","Beant Kaur","Jaspreet Kaur","Chandanpreet Kaur"];

    List<Student> studentList = List<Student>.generate(students.length, (index) =>
        Student(Name:students[index],RollNo: "Roll No $index",Course: "B.Tech"));
    return studentList;
  }
}

