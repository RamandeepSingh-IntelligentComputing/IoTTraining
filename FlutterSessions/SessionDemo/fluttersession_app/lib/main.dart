import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersession_app/StatefulDemoWidget.dart';

void main() {
  runApp( MyApp());
}

List<student> st = List.generate(5, (index) => student('Student $index','Msc'));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Center(child:Text("Login UI"),)),
          drawer: Drawer(child: drawerColumn(context),),
          body: StatefulDemoWidget()
        )
    ));
  }
}


class student{
  String name;
  String course;

  student(this.name,this.course);

}

class dynamicStudentList extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return(Container(
        child:Column(children: [
          Expanded(child: ListView.builder(itemCount:st.length,
           itemBuilder: (BuildContext context,int index){
            return studentRow(st[index]);
          })),
          ElevatedButton(onPressed: (){
            st.add(student('New Student 5','MCA'));
            print('Data Added');
            }, child: Text("Add")),
    ],)
    ));
  }
}

Widget studentRow(student s){
  return(
      ListTile(leading: Icon(Icons.account_circle,size: 30,),title: Text(" ${s.name} "),
          subtitle: Text("${s.course}"),trailing: ElevatedButton(child: Text("..."),onPressed: (){},))
  );
}

Widget drawerColumn(BuildContext context){
  return Container(
      child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.agriculture_sharp,size: 150,color: Colors.black,),
          Icon(Icons.anchor_rounded,size: 150,color: Colors.black,),
          Icon(Icons.android_outlined,size: 150,color: Colors.black,),
        ],
      ));
}

/*
class studentList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
        ListView(
          children: [
            ListTile(leading: Icon(Icons.account_circle,size: 30,),title: Text("Student 1"),
              subtitle: Text("B.Tech"),trailing: ElevatedButton(child: Text("..."),onPressed: (){},),),
            ListTile(leading: Icon(Icons.account_circle,size: 30,),title: Text("Student 2"),
              subtitle: Text("B.Tech"),trailing: ElevatedButton(child: Text("..."),onPressed: (){},),),
            ListTile(leading: Icon(Icons.account_circle,size: 30,),title: Text("Student 3"),
              subtitle: Text("B.Tech"),trailing: ElevatedButton(child: Text("..."),onPressed: (){},),),
            ListTile(leading: Icon(Icons.account_circle,size: 30,),title: Text("Student 4"),
              subtitle: Text("B.Tech"),trailing: ElevatedButton(child: Text("..."),onPressed: (){},),)
          ],
        )
    );
  }
}

class loginUi extends StatelessWidget{

  TextEditingController lc = TextEditingController();
  TextEditingController pc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return(
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0),color:Colors.blueGrey),
            child:Stack(children:[
              mainContainer(context,lc,pc),
              Align(child:buttonRow(context,lc,pc),alignment: Alignment.bottomCenter),
            ])
        )
    );
  }
}

Widget mainContainer(BuildContext context,TextEditingController lc, TextEditingController pc)
{
  return(
   Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Padding(child:loginRow(context,lc),padding: EdgeInsets.all(10.0),),
        Padding(child:passRow(context,pc),padding: EdgeInsets.all(10.0),),

    ],
  )
  );
}

Widget loginRow(BuildContext context,TextEditingController lc)
{
  return(
      Row(mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Text("Login ",style: TextStyle(decoration: TextDecoration.none,
            fontSize: 18,color:Colors.black ),),
        Expanded(child:Material(child:TextField(controller: lc,)))
      ],
  )
  );
}

Widget passRow(BuildContext context,TextEditingController pc)
{
  return(
  Row(
        children: [
          const Text("Password ",style: TextStyle(decoration: TextDecoration.none,
              fontSize: 18,color:Colors.black ),),
          Expanded(child: Material(child:TextField(controller: pc,obscureText: true,)))
        ],
      )
  );
}

Widget buttonRow(BuildContext context,TextEditingController lc,TextEditingController pc)
{
  return(
  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ElevatedButton(onPressed: (){lc.text="";}, child: Text("Sign Up")),
      ElevatedButton(onPressed: (){print("Login Pressed - ${lc.text} - ${pc.text}");}, child: Text("Login"))
    ],
  )
  );
}

Widget ComponentRow(BuildContext context){
  return(
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      DisplayComopnent(context, "1"),
      DisplayComopnent(context, "2"),
      DisplayComopnent(context, "3"),
      DisplayComopnent(context, "4"),
    ],
  )
  );
}

Widget ComponentList(BuildContext context){
  return(
  Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      DisplayComopnent(context,"Display Component 1"),
      DisplayComopnent(context,"Display Component 2"),
      DisplayComopnent(context,"Display Component 3"),
      DisplayComopnent(context,"Display Component 4"),
    ],
  )
  );
}

Widget DisplayComopnent(BuildContext contex,String msg)
{
  return(
  Padding( padding: EdgeInsets.all(5.0),
        child:Text("Hello $msg",style: TextStyle(fontSize: 20),)
  ));
}
*/

