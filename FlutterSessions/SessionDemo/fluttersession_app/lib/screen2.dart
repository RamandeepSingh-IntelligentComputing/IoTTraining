import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen2 extends StatelessWidget{
  String name;
  String collage;

  screen2(this.name,this.collage);

  @override
  Widget build(BuildContext context) {

    return(
        Scaffold(appBar: AppBar(title: Text('Screen 2'),),
          body: Container(child:Center(child:Column(children: [
            Expanded(child: Center(child:Text('Name - ${name}')),),
            Expanded(child: Center(child:Text('College - ${collage}')),),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },child: Text('Back'),  )
          ],)
             )),
        )
    );
  }

}