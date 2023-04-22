import 'package:flutter/material.dart';

class BasicStatefullWidget extends StatefulWidget{

  String header;
  BasicStatefullWidget(this.header);

    BasicStatefullWidgetState createState()=> BasicStatefullWidgetState();
}

class BasicStatefullWidgetState extends State<BasicStatefullWidget>{

  void update(){
    DateTime dt = DateTime.now();

    setState(() {
      widget.header = "Updated Successfully";
    });
  }

  @override
  Widget build(BuildContext context) {
   return(
    Scaffold(
    appBar: AppBar(title: Text(widget.header),),
    body: Center(child: ElevatedButton(
      onPressed:update,child:Text("Update")
    ),),
    )
   );
  }
}
