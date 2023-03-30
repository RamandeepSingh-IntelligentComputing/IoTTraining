import 'package:flutter/material.dart';

class BasicStatefullWidget extends StatefulWidget{

  String header;
  BasicStatefullWidget(this.header);

    BasicStatefullWidgetState createState()=> BasicStatefullWidgetState();
}

class BasicStatefullWidgetState extends State<BasicStatefullWidget>{
  late String header = "";

  BasicStatefullWidgetState(){
    header = widget.header;
  }

  void update(){
    setState(() {
      widget.header = "Updated Successfully";
    });

  }

  @override
  Widget build(BuildContext context) {
   return(
    Scaffold(
    appBar: AppBar(title: Text(header),),
    body: Center(child: ElevatedButton(
      onPressed:update,child:Text("Update")
    ),),
    )
   );
  }
}
