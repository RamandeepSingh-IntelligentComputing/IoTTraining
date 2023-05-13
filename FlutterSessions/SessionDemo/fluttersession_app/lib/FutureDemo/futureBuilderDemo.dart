import 'package:flutter/material.dart';

class futureBuilderdemo extends StatefulWidget{
  futureBuilderdemostate createState()=> futureBuilderdemostate();
}

class futureBuilderdemostate extends State<futureBuilderdemo>{

  String dummyText ='Dummy Text1';

  Future<String> setText() async{
    return Future.delayed(Duration(seconds: 10), (){
      print("set Text Executed");
      return "Async Block Executed";
    });
  }

  @override
  Widget build(BuildContext context) {
    print("See this works...");
    return(
        Scaffold(
          body:FutureBuilder(
           future: setText(),
           initialData: "No Data",
           builder: (cntx,snapshot){
             /*if(snapshot.connectionState == ConnectionState.waiting){
               return (Center(child: Text("State Waiting"),));
             }
             else if(snapshot.connectionState == ConnectionState.active){
               return (Center(child: Text("State active"),));
             }*/
             if(snapshot.hasData){
               return (Center(child: Text(snapshot.data as String),));
             }
             else
               return (Center(child: Text(snapshot.data as String),));
           },
          )
        )

    );

  }

}